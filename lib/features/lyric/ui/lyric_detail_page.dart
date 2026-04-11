import 'dart:async';

import 'package:cnjpkr_song_lyric_trnslt/core/helpers/check_connectivity.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/chunk.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/saved_keyword.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/song_lyric.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/repositories/lyric_repository.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/repositories/saved_keyword_repository.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LyricDetailPage extends ConsumerStatefulWidget {
  final String? lyricId;
  final SongLyric? songLyric;
  const LyricDetailPage({super.key, this.lyricId, this.songLyric});

  @override
  ConsumerState<LyricDetailPage> createState() => _LyricDetailPageState();
}

class _LyricDetailPageState extends ConsumerState<LyricDetailPage> {
  late YoutubePlayerController _youtubePlayerController;
  Timer? _menuTimer;
  OverlayEntry? _overlayEntry;
  bool _isOnline = true;
  bool _playerInitialized = false;

  @override
  void initState() {
    super.initState();

    isOnline().then((online) {
      setState(() => _isOnline = online);
    });

    if (widget.songLyric != null) {
      final videoId = YoutubePlayer.convertUrlToId(widget.songLyric!.youtubeURL) ?? "";
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(autoPlay: false),
      );
      _playerInitialized = true;
    }
  }

  @override
  void dispose() {
    if (_playerInitialized) {
      _youtubePlayerController.dispose();
    }
    _menuTimer?.cancel();
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SongLyric? song;
    if (widget.songLyric != null) {
      song = widget.songLyric;
    } else if (widget.lyricId != null) {
      song = ref.watch(songByIdProvider(int.parse(widget.lyricId!))).value;
    }

    if (song == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (!_playerInitialized) {
      final videoId = YoutubePlayer.convertUrlToId(song.youtubeURL) ?? "";
      _youtubePlayerController =
          YoutubePlayerController(initialVideoId: videoId, flags: const YoutubePlayerFlags(autoPlay: false));
      _playerInitialized = true;
    }

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _youtubePlayerController,
        showVideoProgressIndicator: true,
      ),
      builder: (context, player) {
        return Scaffold(
          extendBodyBehindAppBar: true,
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
          body: Column(
            children: [
              _isOnline
                  ? player
                  : Container(
                      height: 200,
                      color: AppColors.surface,
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.wifi_off, color: AppColors.textMuted, size: 40),
                            SizedBox(height: 8),
                            Text('No internet connection'),
                          ],
                        ),
                      ),
                    ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  itemCount: song?.lyrics.length ?? 0,
                  itemBuilder: (context, index) {
                    var lyric = song?.lyrics[index];
                    return GestureDetector(
                      onLongPress: () {
                        HapticFeedback.mediumImpact();
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: AppColors.surface,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                          ),
                          builder: (context) {
                            return Consumer(
                              builder: (context, ref, child) {
                                final surfaceKey = lyric.chunks.map((c) => c.surface).join(',');
                                final savedState = ref.watch(savedKeywordsProvider(surfaceKey));

                                return savedState.when(
                                    loading: () => const Center(child: CircularProgressIndicator()),
                                    error: (e, _) => const Center(child: Text('Error')),
                                    data: (savedSurfaces) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          left: 24,
                                          right: 24,
                                          top: 24,
                                          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Analyzing Phrase", style: Theme.of(context).textTheme.titleLarge),
                                            Text(
                                              "Tap to save keyword you find interesting",
                                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                    color: AppColors.textMuted,
                                                  ),
                                            ),
                                            const SizedBox(height: 20),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Wrap(
                                                  alignment: WrapAlignment.center,
                                                  spacing: 4,
                                                  runSpacing: 4,
                                                  children: lyric.chunks.map((chunk) {
                                                    if (chunk.reading.isEmpty) {
                                                      return Text(chunk.surface);
                                                    }

                                                    return Column(
                                                      children: [
                                                        Text(
                                                          chunk.reading,
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium
                                                              ?.copyWith(color: AppColors.primary),
                                                        ),
                                                        const SizedBox(height: 4),
                                                        Text(
                                                          chunk.surface,
                                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                                color: AppColors.textPrimary,
                                                                fontSize: 24,
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                        ),
                                                      ],
                                                    );
                                                  }).toList(),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  lyric.translation.id,
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(color: AppColors.textMuted),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Wrap(
                                              spacing: 12,
                                              runSpacing: 12,
                                              alignment: WrapAlignment.center,
                                              children: lyric.chunks.where((chunk) => chunk.isKeyword).map((chunk) {
                                                final isSaved = savedSurfaces.contains(chunk.surface);
                                                return GestureDetector(
                                                  onTap: () async {
                                                    HapticFeedback.lightImpact();

                                                    if (isSaved) {
                                                      final entities = await ref
                                                          .read(savedKeywordRepositoryProvider)
                                                          .getByChunk(chunk.surface, lyric.lineId);

                                                      if (entities != null) {
                                                        await ref
                                                            .read(savedKeywordRepositoryProvider)
                                                            .deleteKeyword(entities.id);
                                                      }
                                                    } else {
                                                      await ref.read(savedKeywordRepositoryProvider).saveKeyword(
                                                            SavedKeyword(
                                                              id: 0,
                                                              surface: chunk.surface,
                                                              reading: chunk.reading,
                                                              meaningEn: chunk.meaning.en,
                                                              meaningId: chunk.meaning.id,
                                                              songLyricId: song!.isarId,
                                                              songTitle: song.metadata.title,
                                                              lineId: lyric.lineId,
                                                              surfaceText: lyric.surfaceText,
                                                              language: song.metadata.scriptLanguage,
                                                              savedAt: DateTime.now(),
                                                            ),
                                                          );
                                                    }
                                                    ref.invalidate(savedKeywordsProvider(surfaceKey));
                                                  },
                                                  child: AnimatedContainer(
                                                    duration: const Duration(milliseconds: 200),
                                                    curve: Curves.bounceInOut,
                                                    padding: const EdgeInsets.all(12),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.surface,
                                                      borderRadius: BorderRadius.circular(16),
                                                      border: isSaved
                                                          ? Border.all(color: AppColors.primary, width: 1.5)
                                                          : Border.all(color: AppColors.surfaceHigh, width: 1),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          chunk.reading,
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium
                                                              ?.copyWith(color: AppColors.primary),
                                                        ),
                                                        const SizedBox(height: 4),
                                                        Text(
                                                          chunk.surface,
                                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                                color: AppColors.textPrimary,
                                                                fontSize: 24,
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                        ),
                                                        const SizedBox(height: 4),
                                                        Text(
                                                          chunk.meaning.id,
                                                          textAlign: TextAlign.center,
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium
                                                              ?.copyWith(color: AppColors.textMuted),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                            );
                          },
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 5,
                            runSpacing: 5,
                            children: lyric!.chunks.map((chunk) {
                              if (chunk.reading.isEmpty || chunk.reading == chunk.surface) {
                                return Text(chunk.surface);
                              }

                              return GestureDetector(
                                onTapUp: (details) {
                                  HapticFeedback.lightImpact();
                                  _showChunkPopUp(context, chunk, details.globalPosition);
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      chunk.reading,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primary),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      chunk.surface,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: AppColors.textPrimary,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            lyric.translation.id,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showChunkPopUp(BuildContext context, Chunk chunk, Offset position) {
    _overlayEntry?.remove();
    _menuTimer?.cancel();

    const popUpHeight = 100.0;
    final screenSize = MediaQuery.of(context).size;

    double dx = position.dx < screenSize.width / 2 ? position.dx : position.dx - 100;

    double dy = position.dy - popUpHeight - 8;
    if (dy < 0) {
      dy = position.dy + 8;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: dx,
        top: dy,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(chunk.reading, style: TextStyle(color: AppColors.primary)),
                Text(chunk.surface, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                Text(chunk.meaning.id, style: TextStyle(color: AppColors.textMuted)),
              ],
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);

    _menuTimer = Timer(const Duration(seconds: 2), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }
}
