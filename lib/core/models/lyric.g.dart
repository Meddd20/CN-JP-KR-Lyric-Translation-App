// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Lyric _$LyricFromJson(Map<String, dynamic> json) => _Lyric(
  lineId: json['lineId'] as String,
  startTime: (json['startTime'] as num).toDouble(),
  endTime: (json['endTime'] as num).toDouble(),
  surfaceText: json['surfaceText'] as String,
  readingText: json['readingText'] as String,
  translation: Meaning.fromJson(json['translation'] as Map<String, dynamic>),
  chunks: (json['chunks'] as List<dynamic>)
      .map((e) => Chunk.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LyricToJson(_Lyric instance) => <String, dynamic>{
  'lineId': instance.lineId,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'surfaceText': instance.surfaceText,
  'readingText': instance.readingText,
  'translation': instance.translation,
  'chunks': instance.chunks,
};
