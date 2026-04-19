import 'package:Versalex/core/enums/script_language.dart';

String languageFlag(ScriptLanguage lang) {
  switch (lang) {
    case ScriptLanguage.ko:
      return '🇰🇷';
    case ScriptLanguage.ja:
      return '🇯🇵';
    case ScriptLanguage.zh:
      return '🇨🇳';
  }
}
