import 'dart:ui';

import 'package:Versalex/core/enums/script_language.dart';
import 'package:Versalex/core/l10n/app_localizations.dart';
import 'package:Versalex/core/models/song_lyric.dart';
import 'package:Versalex/core/providers/language_provider.dart';
import 'package:Versalex/core/repositories/lyric_repository.dart';
import 'package:Versalex/core/theme/app_theme.dart';
import 'package:Versalex/core/widgets/custom_search_bar.dart';
import 'package:Versalex/features/lyric/ui/widgets/filter_by_language_chip.dart';
import 'package:Versalex/features/lyric/ui/widgets/history_card.dart';
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
    final l10n = AppLocalizations(ref.watch(languageProviderProvider));
    final categories = [l10n.allLessons, l10n.mandarin, l10n.japanese, l10n.korean];

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 50, 24, 50),
          child: Column(
            children: [
              CustomSearchBar(
                searchController: _searchController,
                hintText: l10n.searchByTitleOrArtist,
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
    final l10n = AppLocalizations(ref.read(languageProviderProvider));
    return asyncValue.when(
      error: (error, _) => Center(
        child: Text("${l10n.errorPrefix}$error"),
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
                      l10n.noSongsSavedYet,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      l10n.pasteYoutubeUrlToStart,
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
                    final isDelete = await showDeleteConfirmation(context);
                    if (isDelete == true) {
                      await ref.read(lyricRepositoryProvider).delete(songs[index].isarId);
                      ref.invalidate(getHistoryProvider(_selectedLanguage));
                    }
                    return false;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RepaintBoundary(
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
                );
              },
            ),
    );
  }

  Future<bool> showDeleteConfirmation(BuildContext context) async {
    final l10n = AppLocalizations(ref.read(languageProviderProvider));
    return await showDialog<bool>(
          context: context,
          barrierColor: Colors.black.withValues(alpha: 0.5),
          builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: AlertDialog(
              backgroundColor: AppColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.delete_outline, color: Colors.red, size: 32),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.deleteSong,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.deleteWarning,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(l10n.delete),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(l10n.cancel, style: const TextStyle(color: AppColors.textMuted)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ) ??
        false;
  }
}
