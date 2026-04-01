import 'package:freezed_annotation/freezed_annotation.dart';

enum Difficulty {
  @JsonValue("Beginner")
  beginner,
  @JsonValue("Intermediate")
  intermediate,
  @JsonValue("Advanced")
  advanced,
}
