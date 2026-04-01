import 'package:cnjpkr_song_lyric_trnslt/core/models/meaning.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_glossary.freezed.dart';
part 'global_glossary.g.dart';

@freezed
abstract class GlobalGlossary with _$GlobalGlossary {
  const factory GlobalGlossary({required String surface, required String reading, required Meaning meaning}) = _GlobalGlossary;

  factory GlobalGlossary.fromJson(Map<String, dynamic> json) => _$GlobalGlossaryFromJson(json);
}
