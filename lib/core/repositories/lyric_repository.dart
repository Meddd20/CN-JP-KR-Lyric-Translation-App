import 'dart:convert';

import 'package:cnjpkr_song_lyric_trnslt/core/databases/isar_provider.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/databases/models/song_lyric_entity.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/enums/script_language.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/song_lyric.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/services/gemini_services.dart';
import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lyric_repository.g.dart';

class LyricRepository {
  final GeminiService _service;
  final Isar _isar;
  LyricRepository(this._service, this._isar);

  Future<SongLyric> getLyric(String youtubeURL) async {
    final songLyric = await _service.transcribeLyric(youtubeURL);
    final songLyricWithURL = songLyric.copyWith(youtubeURL: youtubeURL);

    final entity = SongLyricEntity()
      ..youtubeURL = youtubeURL
      ..title = songLyric.metadata.title
      ..artist = songLyric.metadata.artist
      ..scriptLanguage = songLyric.metadata.scriptLanguage.name
      ..difficulty = songLyric.metadata.difficulty.name
      ..tags = songLyric.metadata.tags
      ..rawJson = jsonEncode(songLyric.toJson())
      ..createdAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.songLyricEntitys.put(entity);
    });

    return songLyricWithURL;
  }

  Future<List<SongLyric>> getHistory() async {
    final entities = await _isar.songLyricEntitys.where().sortByCreatedAtDesc().findAll();

    return entities.map(_entityToLyric).toList();
  }

  Future<List<SongLyric>> getHistoryByLanguage(ScriptLanguage language) async {
    final entities = await _isar.songLyricEntitys.filter().scriptLanguageEqualTo(language.name).findAll();

    return entities.map(_entityToLyric).toList();
  }

  Future<List<SongLyric>> getRecentHistory() async {
    final entities = await _isar.songLyricEntitys.where().sortByCreatedAtDesc().limit(5).findAll();
    return entities.map(_entityToLyric).toList();
  }

  Future<List<SongLyric>> getSongsTitleArtist(String query) async {
    if (query.isEmpty) return [];

    final entities = await _isar.songLyricEntitys
        .filter()
        .titleContains(query, caseSensitive: false)
        .or()
        .artistContains(query, caseSensitive: false)
        .findAll();

    return entities.map(_entityToLyric).toList();
  }

  Future<SongLyric?> getById(int id) async {
    final entity = await _isar.songLyricEntitys.get(id);

    if (entity == null) return null;

    final lyric = SongLyric.fromJson(jsonDecode(entity.rawJson));
    return lyric.copyWith(isarId: entity.id);
  }

  Future<void> delete(int id) async {
    await _isar.writeTxn(() async {
      await _isar.songLyricEntitys.delete(id);
    });
  }

  SongLyric _entityToLyric(SongLyricEntity entity) {
    final lyric = SongLyric.fromJson(jsonDecode(entity.rawJson));
    return lyric.copyWith(isarId: entity.id, createdAt: entity.createdAt);
  }
}

@riverpod
LyricRepository lyricRepository(Ref ref) {
  return LyricRepository(ref.watch(geminiServiceProvider), ref.watch(isarProvider));
}

@riverpod
Future<List<SongLyric>> recentHistory(Ref ref) async {
  return await ref.read(lyricRepositoryProvider).getRecentHistory();
}

@riverpod
Future<List<SongLyric>> getHistory(Ref ref, ScriptLanguage? language) async {
  if (language == null) {
    return await ref.read(lyricRepositoryProvider).getHistory();
  }
  return await ref.read(lyricRepositoryProvider).getHistoryByLanguage(language);
}

@riverpod
Future<List<SongLyric>> songsByTitleArtist(Ref ref, String searchQuery) async {
  return await ref.read(lyricRepositoryProvider).getSongsTitleArtist(searchQuery);
}

@riverpod
Future<SongLyric?> songById(Ref ref, int id) async {
  return await ref.read(lyricRepositoryProvider).getById(id);
}
