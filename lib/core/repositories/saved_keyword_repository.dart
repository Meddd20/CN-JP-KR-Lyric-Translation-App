import 'package:Versalex/core/databases/isar_provider.dart';
import 'package:Versalex/core/databases/models/saved_keyword_entity.dart';
import 'package:Versalex/core/enums/script_language.dart';
import 'package:Versalex/core/enums/vocab_sort_by.dart';
import 'package:Versalex/core/helpers/reading_tone_normalize.dart';
import 'package:Versalex/core/models/saved_keyword.dart';
import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'saved_keyword_repository.g.dart';

class SavedKeywordRepository {
  final Isar _isar;

  SavedKeywordRepository(this._isar);

  Future<void> saveKeyword(SavedKeyword keywords) async {
    final existing = await getBySurface(keywords.surface);

    if (existing != null) return;

    final entity = SavedKeywordEntity()
      ..surface = keywords.surface
      ..reading = keywords.reading
      ..meaningEn = keywords.meaningEn
      ..meaningId = keywords.meaningId
      ..songLyricId = keywords.songLyricId
      ..songTitle = keywords.songTitle
      ..language = keywords.language
      ..savedAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.savedKeywordEntitys.put(entity);
    });
  }

  Future<List<SavedKeyword>> getAll() async {
    final entities = await _isar.savedKeywordEntitys.where().sortByReadingDesc().findAll();
    return entities.map(SavedKeyword.fromEntity).toList();
  }

  Future<List<SavedKeyword>> getAllKeywords(ScriptLanguage language) async {
    final entities = await _isar.savedKeywordEntitys.where().languageEqualTo(language).sortBySavedAtDesc().findAll();
    return entities.map(SavedKeyword.fromEntity).toList();
  }

  Future<SavedKeywordEntity?> getBySurface(String surface) async {
    return await _isar.savedKeywordEntitys.filter().surfaceEqualTo(surface).findFirst();
  }

  Future<SavedKeyword?> getByKeywordBySong(int id) async {
    final entity = await _isar.savedKeywordEntitys.get(id);
    if (entity == null) return null;
    return SavedKeyword.fromEntity(entity);
  }

  Future<Set<String>> getSavedKeywordsFromList(List<String> surfaces) async {
    if (surfaces.isEmpty) return {};

    final entities =
        await _isar.savedKeywordEntitys.filter().anyOf(surfaces, (q, String s) => q.surfaceEqualTo(s)).findAll();

    return entities.map((e) => e.surface).toSet();
  }

  Future<List<SavedKeyword>> searchKeyword(String query) async {
    if (query.isEmpty) return [];

    final normalizedQuery = stripToneMarks(query.toLowerCase());
    final all = await _isar.savedKeywordEntitys.where().findAll();

    return all
        .where((k) {
          final readingNormalized = stripToneMarks(k.reading.toLowerCase());
          return readingNormalized.contains(normalizedQuery) ||
              k.surface.contains(normalizedQuery) ||
              k.meaningEn.toLowerCase().contains(normalizedQuery) ||
              k.meaningId.toLowerCase().contains(normalizedQuery);
        })
        .map(SavedKeyword.fromEntity)
        .toList();
  }

  Future<void> deleteKeyword(int id) async {
    await _isar.writeTxn(() async {
      await _isar.savedKeywordEntitys.delete(id);
    });
  }
}

@riverpod
SavedKeywordRepository savedKeywordRepository(Ref ref) {
  final isar = ref.watch(isarProvider);
  return SavedKeywordRepository(isar);
}

@riverpod
Future<Set<String>> savedKeywords(Ref ref, String surfaces) {
  final list = surfaces.isEmpty ? <String>[] : surfaces.split(',');
  return ref.read(savedKeywordRepositoryProvider).getSavedKeywordsFromList(list);
}

@riverpod
Future<List<SavedKeyword>> keywordByLanguage(Ref ref, ScriptLanguage language, VocabSortBy sortBy) async {
  final keywords = await ref.read(savedKeywordRepositoryProvider).getAllKeywords(language);

  switch (sortBy) {
    case VocabSortBy.latest:
      return keywords;
    case VocabSortBy.oldest:
      return keywords.reversed.toList();
    case VocabSortBy.ascending:
      keywords.sort((a, b) => a.reading.compareTo(b.reading));
      return keywords;
    case VocabSortBy.descending:
      keywords.sort((a, b) => b.reading.compareTo(a.reading));
      return keywords;
  }
}

@riverpod
Future<List<SavedKeyword>> searchKeyword(Ref ref, String query) {
  return ref.read(savedKeywordRepositoryProvider).searchKeyword(query);
}
