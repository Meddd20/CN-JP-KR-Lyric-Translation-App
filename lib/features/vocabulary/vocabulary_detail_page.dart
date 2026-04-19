import 'package:Versalex/core/enums/app_languages.dart';
import 'package:Versalex/core/enums/script_language.dart';
import 'package:Versalex/core/l10n/app_localizations.dart';
import 'package:Versalex/core/enums/vocab_sort_by.dart';
import 'package:Versalex/core/helpers/language_color.dart';
import 'package:Versalex/core/models/saved_keyword.dart';
import 'package:Versalex/core/providers/language_provider.dart';
import 'package:Versalex/core/repositories/saved_keyword_repository.dart';
import 'package:Versalex/core/theme/app_theme.dart';
import 'package:Versalex/core/widgets/custom_search_bar.dart';
import 'package:Versalex/features/vocabulary/widgets/vocabulary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VocabularyDetailPage extends ConsumerStatefulWidget {
  final ScriptLanguage language;

  const VocabularyDetailPage({
    super.key,
    required this.language,
  });

  @override
  ConsumerState<VocabularyDetailPage> createState() => _VocabularyDetailPageState();
}

class _VocabularyDetailPageState extends ConsumerState<VocabularyDetailPage> {
  var sortBy = VocabSortBy.latest;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Invalidate saat page pertama kali dan saat kembali
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.invalidate(keywordByLanguageProvider(widget.language, sortBy));
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProviderProvider);
    final l10n = AppLocalizations(language);

    final keywordPerLanguage = ref.watch(keywordByLanguageProvider(widget.language, sortBy));
    final keywordSearchRes = ref.watch(searchKeywordProvider(searchController.text));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.background.withValues(alpha: 0.7),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.collectionLabel,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textMuted,
                      ),
                ),
                Text(
                  widget.language.displayName,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: languageColor(widget.language),
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.yourPersonalCollection,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 14),
                CustomSearchBar(
                  searchController: searchController,
                  hintText: l10n.searchYourVocabulary,
                  onChanged: (value) {
                    setState(() {});
                  },
                  onTapOutside: (PointerDownEvent event) {
                    FocusScope.of(context).unfocus();
                  },
                  onDeleteText: () {
                    searchController.clear();
                    setState(() {});
                  },
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.savedWords,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          l10n.showingTerms(keywordPerLanguage.value?.length ?? 0),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    PopupMenuButton<VocabSortBy>(
                      onSelected: (value) {
                        setState(() {
                          sortBy = value;
                        });
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: VocabSortBy.latest,
                          child: Text(l10n.sortLatest),
                        ),
                        PopupMenuItem(
                          value: VocabSortBy.oldest,
                          child: Text(l10n.sortOldest),
                        ),
                        PopupMenuItem(
                          value: VocabSortBy.ascending,
                          child: Text(l10n.sortAscending),
                        ),
                        PopupMenuItem(
                          value: VocabSortBy.descending,
                          child: Text(l10n.sortDescending),
                        ),
                      ],
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            sortBy.name.toUpperCase(),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.textMuted,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.textMuted,
                            size: 16,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 14),
                searchController.text.isEmpty
                    ? _buildList(keywordPerLanguage, language)
                    : _buildList(keywordSearchRes, language),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList(AsyncValue<List<SavedKeyword>> asyncValue, AppLanguage language) {
    final l10n = AppLocalizations(ref.read(languageProviderProvider));
    return asyncValue.when(
      error: (error, _) => Center(
        child: Text("${l10n.errorPrefix}$error"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (keywords) => keywords.isEmpty
          ? SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Center(
                child: Text(l10n.noVocabSavedYet),
              ),
            )
          : ListView.builder(
              itemCount: keywords.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(keywords[index].id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    color: Colors.red,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    final deletedId = keywords[index].id;
                    await ref.read(savedKeywordRepositoryProvider).deleteKeyword(deletedId);
                    ref.invalidate(keywordByLanguageProvider(widget.language, sortBy));
                    return false;
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: VocabularyCard(
                      language: widget.language,
                      surface: keywords[index].surface,
                      reading: keywords[index].reading,
                      meaning: language == AppLanguage.en ? keywords[index].meaningEn : keywords[index].meaningId,
                      navigateToSong: () async {
                        await context.push('/lyric/${keywords[index].songLyricId}');
                        _invalidateAllSorts();
                      },
                      songReference: keywords[index].songTitle,
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _invalidateAllSorts() {
    for (final sort in VocabSortBy.values) {
      ref.invalidate(keywordByLanguageProvider(widget.language, sort));
    }
  }
}
