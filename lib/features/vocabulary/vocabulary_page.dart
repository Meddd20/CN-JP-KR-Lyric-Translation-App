import 'package:Versalex/core/enums/script_language.dart';
import 'package:Versalex/core/enums/vocab_sort_by.dart';
import 'package:Versalex/core/l10n/app_localizations.dart';
import 'package:Versalex/core/providers/language_provider.dart';
import 'package:Versalex/core/repositories/saved_keyword_repository.dart';
import 'package:Versalex/core/theme/app_theme.dart';
import 'package:Versalex/features/vocabulary/widgets/vocabulary_language_preview_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VocabularyPage extends ConsumerWidget {
  const VocabularyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProviderProvider);
    final l10n = AppLocalizations(language);

    final chineseKeywords = ref.watch(keywordByLanguageProvider(ScriptLanguage.zh, VocabSortBy.latest));
    final japaneseKeywords = ref.watch(keywordByLanguageProvider(ScriptLanguage.ja, VocabSortBy.latest));
    final koreanKeywords = ref.watch(keywordByLanguageProvider(ScriptLanguage.ko, VocabSortBy.latest));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 50, 24, 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.collection,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
              ),
              Text(
                l10n.savedVocabulary,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.textPrimary,
                    ),
              ),
              if (japaneseKeywords.value?.isNotEmpty == true) ...[
                const SizedBox(height: 20),
                japaneseKeywords.when(
                  data: (keywords) {
                    return VocabularyLanguagePreviewSection(
                      language: ScriptLanguage.ja,
                      navigateToVocabDetail: () {
                        context.push("/vocabulary/${ScriptLanguage.ja.name}");
                      },
                      keywords: keywords,
                      appLanguage: language,
                      viewAllLabel: l10n.viewAll,
                    );
                  },
                  error: (error, _) => const SizedBox(),
                  loading: () => const SizedBox(),
                ),
              ],
              if (koreanKeywords.value?.isNotEmpty == true) ...[
                const SizedBox(height: 15),
                koreanKeywords.when(
                  data: (keywords) {
                    return VocabularyLanguagePreviewSection(
                      language: ScriptLanguage.ko,
                      navigateToVocabDetail: () {
                        context.push("/vocabulary/${ScriptLanguage.ko.name}");
                      },
                      keywords: keywords,
                      appLanguage: language,
                      viewAllLabel: l10n.viewAll,
                    );
                  },
                  error: (error, _) => const SizedBox(),
                  loading: () => const SizedBox(),
                ),
              ],
              if (chineseKeywords.value?.isNotEmpty == true) ...[
                const SizedBox(height: 15),
                chineseKeywords.when(
                  data: (keywords) {
                    return VocabularyLanguagePreviewSection(
                      language: ScriptLanguage.zh,
                      navigateToVocabDetail: () {
                        context.push("/vocabulary/${ScriptLanguage.zh.name}");
                      },
                      keywords: keywords,
                      appLanguage: language,
                      viewAllLabel: l10n.viewAll,
                    );
                  },
                  error: (error, _) => const SizedBox(),
                  loading: () => const SizedBox(),
                ),
              ],
              if (japaneseKeywords.value?.isEmpty == true &&
                  chineseKeywords.value?.isEmpty == true &&
                  koreanKeywords.value?.isEmpty == true)
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.bookmark_outline, size: 48, color: AppColors.textMuted),
                        const SizedBox(height: 12),
                        Text(
                          l10n.noVocabSavedYet,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.saveWordsFromLyrics,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
