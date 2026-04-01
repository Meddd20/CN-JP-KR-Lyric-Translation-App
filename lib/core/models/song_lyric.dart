import 'package:cnjpkr_song_lyric_trnslt/core/models/global_glossary.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/lyric.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_lyric.freezed.dart';
part 'song_lyric.g.dart';

@freezed
abstract class SongLyric with _$SongLyric {
  const factory SongLyric({required Metadata metadata, required List<GlobalGlossary> globalGlossary, required List<Lyric> lyrics}) = _SongLyric;

  factory SongLyric.fromJson(Map<String, dynamic> json) => _$SongLyricFromJson(json);
}
