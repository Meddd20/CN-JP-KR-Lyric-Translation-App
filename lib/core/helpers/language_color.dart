import 'package:Versalex/core/enums/script_language.dart';
import 'package:Versalex/core/theme/app_theme.dart';
import 'package:flutter/widgets.dart';

Color languageColor(ScriptLanguage lang) {
  switch (lang) {
    case ScriptLanguage.ko:
      return AppColors.korean;
    case ScriptLanguage.ja:
      return AppColors.japanese;
    case ScriptLanguage.zh:
      return AppColors.mandarin;
  }
}
