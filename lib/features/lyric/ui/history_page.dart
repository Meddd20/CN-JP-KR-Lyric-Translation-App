import 'package:cnjpkr_song_lyric_trnslt/core/enums/script_language.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/song_lyric.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/repositories/lyric_repository.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/widgets/custom_search_bar.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/ui/widgets/filter_by_language_chip.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/ui/widgets/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  final SearchController _searchController = SearchController();
  final List<String> categories = ["All Lessons", "Mandarin", "Japanese", "Korean"];
  int selectedIndex = 0;
  ScriptLanguage? get _selectedLanguage {
    if (selectedIndex == 0) return null;
    if (selectedIndex == 1) return ScriptLanguage.zh;
    if (selectedIndex == 2) return ScriptLanguage.ja;
    if (selectedIndex == 3) return ScriptLanguage.ko;
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final historyState = ref.watch(getHistoryProvider(_selectedLanguage));
    final searchState = ref.watch(songsByTitleArtistProvider(_searchController.text));

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 50, 24, 120),
          child: Column(
            children: [
              CustomSearchBar(
                searchController: _searchController,
                hintText: "Search by title or artist...",
                onChanged: (value) {
                  setState(() {});
                },
                onTapOutside: (PointerDownEvent event) {
                  FocusScope.of(context).unfocus();
                },
                onDeleteText: () {
                  _searchController.clear();
                  setState(() {});
                },
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: Theme.of(context).textTheme.bodySmall!.fontSize! * 2.65,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return FilterByLanguageChip(
                      label: categories[index],
                      isSelected: index == selectedIndex,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: _searchController.text.isEmpty ? _buildList(historyState) : _buildList(searchState),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList(AsyncValue<List<SongLyric>> asyncValue) {
    return asyncValue.when(
      error: (error, _) => Center(
        child: Text("Error: $error"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (songs) => songs.isEmpty
          ? SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.library_music, size: 48, color: AppColors.textMuted),
                    const SizedBox(height: 12),
                    Text(
                      "No songs saved yet",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Paste a YouTube URL on the home page to get started",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textMuted,
                          ),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              itemCount: songs.length < 5 ? songs.length : 5,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(songs[index].isarId.toString()),
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
                    await ref.read(lyricRepositoryProvider).delete(songs[index].isarId);
                    ref.invalidate(getHistoryProvider(_selectedLanguage));
                    return false;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RepaintBoundary(
                      child: SizedBox(
                        width: 200,
                        child: HistoryCard(
                          youtubeURL: songs[index].youtubeURL,
                          language: songs[index].metadata.scriptLanguage,
                          title: songs[index].metadata.title,
                          artist: songs[index].metadata.artist,
                          difficulty: songs[index].metadata.difficulty,
                          dateTime: songs[index].createdAt,
                          onTap: () {
                            context.push('/lyric/detail', extra: songs[index]);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
