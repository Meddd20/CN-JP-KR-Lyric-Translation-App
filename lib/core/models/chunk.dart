import 'package:freezed_annotation/freezed_annotation.dart';

part 'chunk.freezed.dart';
part 'chunk.g.dart';

@freezed
abstract class Chunk with _$Chunk {
  const factory Chunk({required String surface, required String reading, required String meaning, required bool isKeywoard}) = _Chunk;

  factory Chunk.fromJson(Map<String, dynamic> json) => _$ChunkFromJson(json);
}
