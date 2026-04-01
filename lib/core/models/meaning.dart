import 'package:freezed_annotation/freezed_annotation.dart';

part 'meaning.freezed.dart';
part 'meaning.g.dart';

@freezed
abstract class Meaning with _$Meaning {
  const factory Meaning({required String id, required String en}) = _Meaning;

  factory Meaning.fromJson(Map<String, dynamic> json) => _$MeaningFromJson(json);
}
