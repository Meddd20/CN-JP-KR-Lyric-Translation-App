import 'package:Versalex/core/models/meaning.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chunk.freezed.dart';
part 'chunk.g.dart';

@freezed
abstract class Chunk with _$Chunk {
  const factory Chunk(
      {required String surface,
      required String reading,
      required Meaning meaning,
      @JsonKey(name: 'is_keyword') required bool isKeyword}) = _Chunk;

  factory Chunk.fromJson(Map<String, dynamic> json) => _$ChunkFromJson(json);
}
