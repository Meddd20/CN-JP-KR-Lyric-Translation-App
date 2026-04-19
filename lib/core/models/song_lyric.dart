import 'package:Versalex/core/models/global_glossary.dart';
import 'package:Versalex/core/models/lyric.dart';
import 'package:Versalex/core/models/metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_lyric.freezed.dart';
part 'song_lyric.g.dart';

@freezed
abstract class SongLyric with _$SongLyric {
  const factory SongLyric({
    @Default(0) int isarId,
    required String youtubeURL,
    required Metadata metadata,
    @JsonKey(name: 'global_glossary', defaultValue: []) required List<GlobalGlossary> globalGlossary,
    required List<Lyric> lyrics,
    required DateTime createdAt,
  }) = _SongLyric;

  factory SongLyric.fromJson(Map<String, dynamic> json) => _$SongLyricFromJson(json);
}
