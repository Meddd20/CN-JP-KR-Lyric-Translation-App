import 'package:cnjpkr_song_lyric_trnslt/core/models/chunk.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/meaning.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyric.freezed.dart';
part 'lyric.g.dart';

@freezed
abstract class Lyric with _$Lyric {
  const factory Lyric({required String lineId, required double startTime, required double endTime, required String surfaceText, required String readingText, required Meaning translation, required List<Chunk> chunks}) = _Lyric;

  factory Lyric.fromJson(Map<String, dynamic> json) => _$LyricFromJson(json);
}
