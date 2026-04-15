import 'package:freezed_annotation/freezed_annotation.dart';

enum ScriptLanguage {
  @JsonValue("zh")
  zh,
  @JsonValue("ja")
  ja,
  @JsonValue("ko")
  ko,
}

extension ScriptLanguageExtension on ScriptLanguage {
  String get displayName {
    switch (this) {
      case ScriptLanguage.zh:
        return 'Chinese';
      case ScriptLanguage.ja:
        return 'Japanese';
      case ScriptLanguage.ko:
        return 'Korean';
    }
  }
}
