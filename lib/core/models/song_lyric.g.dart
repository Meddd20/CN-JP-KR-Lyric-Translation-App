// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_lyric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SongLyric _$SongLyricFromJson(Map<String, dynamic> json) => _SongLyric(
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      globalGlossary: (json['globalGlossary'] as List<dynamic>)
          .map((e) => GlobalGlossary.fromJson(e as Map<String, dynamic>))
          .toList(),
      lyrics: (json['lyrics'] as List<dynamic>)
          .map((e) => Lyric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SongLyricToJson(_SongLyric instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'globalGlossary': instance.globalGlossary,
      'lyrics': instance.lyrics,
    };
