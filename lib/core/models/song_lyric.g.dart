// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_lyric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SongLyric _$SongLyricFromJson(Map<String, dynamic> json) => _SongLyric(
      isarId: (json['isarId'] as num?)?.toInt() ?? 0,
      youtubeURL: json['youtubeURL'] as String,
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      globalGlossary: (json['globalGlossary'] as List<dynamic>)
          .map((e) => GlobalGlossary.fromJson(e as Map<String, dynamic>))
          .toList(),
      lyrics: (json['lyrics'] as List<dynamic>)
          .map((e) => Lyric.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SongLyricToJson(_SongLyric instance) =>
    <String, dynamic>{
      'isarId': instance.isarId,
      'youtubeURL': instance.youtubeURL,
      'metadata': instance.metadata,
      'globalGlossary': instance.globalGlossary,
      'lyrics': instance.lyrics,
      'createdAt': instance.createdAt.toIso8601String(),
    };
