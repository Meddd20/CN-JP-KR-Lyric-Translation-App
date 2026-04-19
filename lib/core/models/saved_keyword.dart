import 'package:Versalex/core/databases/models/saved_keyword_entity.dart';
import 'package:Versalex/core/enums/script_language.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_keyword.freezed.dart';
part 'saved_keyword.g.dart';

@freezed
abstract class SavedKeyword with _$SavedKeyword {
  const factory SavedKeyword({
    required int id,
    required String surface,
    required String reading,
    required String meaningEn,
    required String meaningId,
    required int songLyricId,
    required String songTitle,
    required ScriptLanguage language,
    required DateTime savedAt,
  }) = _SavedKeyword;

  factory SavedKeyword.fromJson(Map<String, dynamic> json) => _$SavedKeywordFromJson(json);

  factory SavedKeyword.fromEntity(SavedKeywordEntity entity) {
    return SavedKeyword(
      id: entity.id,
      surface: entity.surface,
      reading: entity.reading,
      meaningEn: entity.meaningEn,
      meaningId: entity.meaningId,
      songLyricId: entity.songLyricId,
      songTitle: entity.songTitle,
      language: entity.language,
      savedAt: entity.savedAt,
    );
  }
}
