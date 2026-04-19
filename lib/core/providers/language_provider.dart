import 'package:Versalex/core/enums/app_languages.dart';
import 'package:Versalex/core/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_provider.g.dart';

@riverpod
class LanguageProvider extends _$LanguageProvider {
  static const _key = "app_language";

  @override
  AppLanguage build() {
    final prefs = ref.watch(sharedPreferencesProvider).value;
    final saved = prefs?.getString(_key) ?? 'id';
    return AppLanguage.values.byName(saved);
  }

  Future<void> setLanguage(AppLanguage language) async {
    final prefs = ref.read(sharedPreferencesProvider).value;
    await prefs?.setString(_key, language.name);
    state = language;
  }
}
