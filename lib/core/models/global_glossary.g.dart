// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_glossary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GlobalGlossary _$GlobalGlossaryFromJson(Map<String, dynamic> json) =>
    _GlobalGlossary(
      surface: json['surface'] as String,
      reading: json['reading'] as String,
      meaning: Meaning.fromJson(json['meaning'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GlobalGlossaryToJson(_GlobalGlossary instance) =>
    <String, dynamic>{
      'surface': instance.surface,
      'reading': instance.reading,
      'meaning': instance.meaning,
    };
