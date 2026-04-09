import 'package:cnjpkr_song_lyric_trnslt/core/enums/difficulty.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/enums/script_language.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata.freezed.dart';
part 'metadata.g.dart';

@freezed
abstract class Metadata with _$Metadata {
  const factory Metadata(
      {required String title,
      required String artist,
      required ScriptLanguage scriptLanguage,
      required Difficulty difficulty,
      required List<String> tags}) = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);
}
