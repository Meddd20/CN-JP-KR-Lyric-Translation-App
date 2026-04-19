import 'package:Versalex/core/models/chunk.dart';
import 'package:Versalex/core/models/meaning.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyric.freezed.dart';
part 'lyric.g.dart';

@freezed
abstract class Lyric with _$Lyric {
  const factory Lyric(
      {@JsonKey(name: 'line_id') required String lineId,
      @JsonKey(name: 'start_time') required double startTime,
      @JsonKey(name: 'end_time') required double endTime,
      @JsonKey(name: 'surface_text') required String surfaceText,
      @JsonKey(name: 'reading_text') required String readingText,
      required Meaning translation,
      required List<Chunk> chunks}) = _Lyric;

  factory Lyric.fromJson(Map<String, dynamic> json) => _$LyricFromJson(json);
}
