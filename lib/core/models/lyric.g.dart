// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Lyric _$LyricFromJson(Map<String, dynamic> json) => _Lyric(
      lineId: json['line_id'] as String,
      startTime: (json['start_time'] as num).toDouble(),
      endTime: (json['end_time'] as num).toDouble(),
      surfaceText: json['surface_text'] as String,
      readingText: json['reading_text'] as String,
      translation:
          Meaning.fromJson(json['translation'] as Map<String, dynamic>),
      chunks: (json['chunks'] as List<dynamic>)
          .map((e) => Chunk.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LyricToJson(_Lyric instance) => <String, dynamic>{
      'line_id': instance.lineId,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'surface_text': instance.surfaceText,
      'reading_text': instance.readingText,
      'translation': instance.translation,
      'chunks': instance.chunks,
    };
