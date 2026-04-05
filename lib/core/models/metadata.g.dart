// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Metadata _$MetadataFromJson(Map<String, dynamic> json) => _Metadata(
      title: json['title'] as String,
      artist: json['artist'] as String,
      scriptLanguage:
          $enumDecode(_$ScriptLanguageEnumMap, json['scriptLanguage']),
      difficulty: $enumDecode(_$DifficultyEnumMap, json['difficulty']),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MetadataToJson(_Metadata instance) => <String, dynamic>{
      'title': instance.title,
      'artist': instance.artist,
      'scriptLanguage': _$ScriptLanguageEnumMap[instance.scriptLanguage]!,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
      'tags': instance.tags,
    };

const _$ScriptLanguageEnumMap = {
  ScriptLanguage.zh: 'zh',
  ScriptLanguage.ja: 'ja',
  ScriptLanguage.ko: 'ko',
};

const _$DifficultyEnumMap = {
  Difficulty.beginner: 'Beginner',
  Difficulty.intermediate: 'Intermediate',
  Difficulty.advanced: 'Advanced',
};
