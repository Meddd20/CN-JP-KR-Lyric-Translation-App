import 'package:cnjpkr_song_lyric_trnslt/core/enums/script_language.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/enums/vocab_sort_by.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/helpers/language_color.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/saved_keyword.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/repositories/saved_keyword_repository.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/widgets/custom_search_bar.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/vocabulary/widgets/vocabulary_card.dart';
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
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keywordPerLanguage = ref.watch(keywordByLanguageProvider(widget.language, sortBy));
    final keywordSearchRes = ref.watch(searchKeywordProvider(searchController.text));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                  "COLLECTION",
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
                  "Your personal collection of new words discovered and saved for later mastery.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 14),
                CustomSearchBar(
                  searchController: searchController,
                  hintText: "Search yout vocabulary",
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
                          "Saved Words",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Showing ${keywordPerLanguage.value?.length ?? 0} terms",
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
                          child: Text("Latest"),
                        ),
                        PopupMenuItem(
                          value: VocabSortBy.oldest,
                          child: Text("Oldest"),
                        ),
                        PopupMenuItem(
                          value: VocabSortBy.ascending,
                          child: Text("Ascending (A → Z)"),
                        ),
                        PopupMenuItem(
                          value: VocabSortBy.descending,
                          child: Text("Descending (Z → A)"),
                        )
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
                searchController.text.isEmpty ? _buildList(keywordPerLanguage) : _buildList(keywordSearchRes),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList(AsyncValue<List<SavedKeyword>> asyncValue) {
    return asyncValue.when(
      error: (error, _) => Center(
        child: Text("Error: $error"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (keywords) => keywords.isEmpty
          ? SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: const Center(
                child: Text("No vocabulary saved yet"),
              ),
            )
          : ListView.builder(
              itemCount: keywords.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: VocabularyCard(
                    language: widget.language,
                    surface: keywords[index].surface,
                    reading: keywords[index].reading,
                    meaning: keywords[index].meaningEn,
                    navigateToSong: () {
                      context.push('/lyric/${keywords[index].songLyricId}');
                    },
                    songReference: keywords[index].songTitle,
                  ),
                );
              },
            ),
    );
  }
}
