// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_keyword.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedKeyword _$SavedKeywordFromJson(Map<String, dynamic> json) =>
    _SavedKeyword(
      id: (json['id'] as num).toInt(),
      surface: json['surface'] as String,
      reading: json['reading'] as String,
      meaningEn: json['meaningEn'] as String,
      meaningId: json['meaningId'] as String,
      songLyricId: (json['songLyricId'] as num).toInt(),
      songTitle: json['songTitle'] as String,
      lineId: json['lineId'] as String,
      surfaceText: json['surfaceText'] as String,
      language: $enumDecode(_$ScriptLanguageEnumMap, json['language']),
      savedAt: DateTime.parse(json['savedAt'] as String),
    );

Map<String, dynamic> _$SavedKeywordToJson(_SavedKeyword instance) =>
    <String, dynamic>{
      'id': instance.id,
      'surface': instance.surface,
      'reading': instance.reading,
      'meaningEn': instance.meaningEn,
      'meaningId': instance.meaningId,
      'songLyricId': instance.songLyricId,
      'songTitle': instance.songTitle,
      'lineId': instance.lineId,
      'surfaceText': instance.surfaceText,
      'language': _$ScriptLanguageEnumMap[instance.language]!,
      'savedAt': instance.savedAt.toIso8601String(),
    };

const _$ScriptLanguageEnumMap = {
  ScriptLanguage.zh: 'zh',
  ScriptLanguage.ja: 'ja',
  ScriptLanguage.ko: 'ko',
};
