// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chunk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chunk _$ChunkFromJson(Map<String, dynamic> json) => _Chunk(
  surface: json['surface'] as String,
  reading: json['reading'] as String,
  meaning: json['meaning'] as String,
  isKeywoard: json['isKeywoard'] as bool,
);

Map<String, dynamic> _$ChunkToJson(_Chunk instance) => <String, dynamic>{
  'surface': instance.surface,
  'reading': instance.reading,
  'meaning': instance.meaning,
  'isKeywoard': instance.isKeywoard,
};
