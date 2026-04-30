import 'dart:async';

import 'package:Versalex/core/enums/app_languages.dart';
import 'package:Versalex/core/helpers/get_youtube_video.dart';
import 'package:Versalex/core/l10n/app_localizations.dart';
import 'package:Versalex/core/enums/script_language.dart';
import 'package:Versalex/core/helpers/check_connectivity.dart';
import 'package:Versalex/core/models/chunk.dart';
import 'package:Versalex/core/models/saved_keyword.dart';
import 'package:Versalex/core/models/song_lyric.dart';
import 'package:Versalex/core/providers/language_provider.dart';
import 'package:Versalex/core/repositories/lyric_repository.dart';
import 'package:Versalex/core/repositories/saved_keyword_repository.dart';
import 'package:Versalex/core/theme/app_theme.dart';
import 'package:Versalex/core/widgets/difficulty_chip.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LyricDetailPage extends ConsumerStatefulWidget {
  final String? lyricId;
  final SongLyric? songLyric;
  const LyricDetailPage({super.key, this.lyricId, this.songLyric});

  @override
  ConsumerState<LyricDetailPage> createState() => _LyricDetailPageState();
}

class _LyricDetailPageState extends ConsumerState<LyricDetailPage> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;
  final _scrollController = ScrollController();

  Timer? _menuTimer;
  OverlayEntry? _overlayEntry;
  bool _isOnline = true;
  bool _playerInitialized = false;
  int _currentLyricIndex = -1;
  bool _userScrolling = false;

  bool _useYoutubePlayer = false;
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();

    isOnline().then((online) {
      setState(() => _isOnline = online);
    });

    _initPlayer();
  }

  Future<void> _initPlayer() async {
    final videoId = widget.songLyric?.youtubeURL ?? widget.lyricId ?? "";
    try {
      final url = await getYoutubeVideo(YoutubePlayer.convertUrlToId(videoId) ?? "");

      _videoController = VideoPlayerController.networkUrl(Uri.parse(url));
      await _videoController.initialize();
      _videoController.addListener(_syncLyric);

      _chewieController = ChewieController(
        videoPlayerController: _videoController,
        autoPlay: false,
        allowFullScreen: false,
        showOptions: false,
        allowPlaybackSpeedChanging: false,
        allowMuting: false,
      );
    } catch (_) {
      _useYoutubePlayer = true;
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(autoPlay: false),
      );
    }
    setState(() => _playerInitialized = true);
  }

  @override
  void dispose() {
    _menuTimer?.cancel();
    _overlayEntry?.remove();
    if (_playerInitialized) {
      if (_useYoutubePlayer) {
        _youtubePlayerController.dispose();
      } else {
        _videoController.removeListener(_syncLyric);
        _videoController.dispose();
        _chewieController.dispose();
      }
    }
    super.dispose();
  }

  void _syncLyric() {
    if (!_videoController.value.isPlaying) return;

    final position = _videoController.value.position.inMilliseconds / 1000.0;
    final lyrics = widget.songLyric?.lyrics ?? [];

    for (var i = lyrics.length - 1; i >= 0; i--) {
      if (position >= lyrics[i].startTime) {
        if (_currentLyricIndex != i) {
          setState(() => _currentLyricIndex = i);
          _scrollToActiveLyric(i);
        }
        break;
      }
    }
  }

  void _scrollToActiveLyric(int index) {
    if (_userScrolling) return;
    final itemHeight = 80.0;
    _scrollController.animateTo(
      index * itemHeight,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProviderProvider);
    final l10n = AppLocalizations(language);

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

    return Scaffold(
      extendBodyBehindAppBar: true,
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
      body: Column(
        children: [
          _isOnline
              ? _playerInitialized
                  ? _useYoutubePlayer
                      ? YoutubePlayer(controller: _youtubePlayerController)
                      : AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: Chewie(controller: _chewieController),
                        )
                  : Container(
                      height: 200,
                      color: AppColors.surface,
                      child: const Center(child: CircularProgressIndicator()),
                    )
              : Container(
                  height: 200,
                  color: AppColors.surface,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.wifi_off, color: AppColors.textMuted, size: 40),
                        const SizedBox(height: 8),
                        Text(l10n.noInternetConnection),
                      ],
                    ),
                  ),
                ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.metadata.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      song.metadata.artist,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textMuted,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DifficultyChip(difficulty: song.metadata.difficulty),
                    const SizedBox(height: 4),
                    Text(
                      "${song.metadata.scriptLanguage.name} ${song.metadata.scriptLanguage.displayName}",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textMuted,
                          ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: AppColors.surface,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      builder: (context) {
                        return Consumer(
                          builder: (context, ref, child) {
                            final surfaceKey = song!.globalGlossary.map((c) => c.surface).join(',');
                            final savedState = ref.watch(savedKeywordsProvider(surfaceKey));

                            return savedState.when(
                              loading: () => const Center(child: CircularProgressIndicator()),
                              error: (e, _) => const Center(child: Text('Error')),
                              data: (data) {
                                return SizedBox(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height * 0.8,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    l10n.songGlossary,
                                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                          color: AppColors.textPrimary,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                  ),
                                                  Text(
                                                    "${song?.globalGlossary.length} ${l10n.uniqueWords}",
                                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                          color: AppColors.textMuted,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  context.pop();
                                                },
                                                icon: Icon(Icons.close),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.separated(
                                          separatorBuilder: (_, __) => SizedBox(
                                            height: 8,
                                          ),
                                          itemCount: song?.globalGlossary.length ?? 0,
                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                          itemBuilder: (contxt, index) {
                                            final item = song!.globalGlossary[index];
                                            final isSaved = data.contains(item.surface);
                                            return Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.surface,
                                                borderRadius: BorderRadius.circular(12),
                                                border: isSaved
                                                    ? Border.all(color: AppColors.primary, width: 1.5)
                                                    : Border.all(color: AppColors.surfaceHigh, width: 1),
                                              ),
                                              child: InkWell(
                                                borderRadius: BorderRadius.circular(12),
                                                onTap: () async {
                                                  HapticFeedback.lightImpact();

                                                  if (isSaved) {
                                                    final entities = await ref
                                                        .read(savedKeywordRepositoryProvider)
                                                        .getBySurface(item.surface);

                                                    if (entities != null) {
                                                      await ref
                                                          .read(savedKeywordRepositoryProvider)
                                                          .deleteKeyword(entities.id);
                                                    }
                                                  } else {
                                                    await ref.read(savedKeywordRepositoryProvider).saveKeyword(
                                                          SavedKeyword(
                                                            id: 0,
                                                            surface: item.surface,
                                                            reading: item.reading,
                                                            meaningEn: item.meaning.en,
                                                            meaningId: item.meaning.id,
                                                            songLyricId: song!.isarId,
                                                            songTitle: song.metadata.title,
                                                            language: song.metadata.scriptLanguage,
                                                            savedAt: DateTime.now(),
                                                          ),
                                                        );
                                                  }
                                                  ref.invalidate(savedKeywordsProvider(surfaceKey));
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        item.surface,
                                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                              color: AppColors.textPrimary,
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                      ),
                                                      const SizedBox(width: 12),
                                                      Text(
                                                        item.reading,
                                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                              color: AppColors.primary,
                                                            ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          language == AppLanguage.en
                                                              ? item.meaning.en
                                                              : item.meaning.id,
                                                          textAlign: TextAlign.end,
                                                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                                color: AppColors.textMuted,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
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
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.auto_stories,
                            size: 16,
                            color: AppColors.textMuted,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Glossary • ${song.globalGlossary.length} ${l10n.words}",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.textMuted,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollStartNotification) {
                  _userScrolling = true;
                } else if (notification is ScrollEndNotification) {
                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() => _userScrolling = false);
                  });
                }
                return false;
              },
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                itemCount: song.lyrics.length,
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
                                    return SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 16,
                                          right: 24,
                                          top: 16,
                                          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                l10n.analyzingPhrase,
                                                style: Theme.of(context).textTheme.titleLarge,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                l10n.tapToSaveKeyword,
                                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                      color: AppColors.textMuted,
                                                    ),
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
                                                  language == AppLanguage.en
                                                      ? lyric.translation.en
                                                      : lyric.translation.id,
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
                                                          .getBySurface(chunk.surface);

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
                                                          language == AppLanguage.en
                                                              ? chunk.meaning.en
                                                              : chunk.meaning.id,
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
                              return IntrinsicWidth(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      ' ', // invisible placeholder, same height as reading
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: Colors.transparent,
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      chunk.surface,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: AppColors.textPrimary,
                                            // fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            return GestureDetector(
                              onTapUp: (details) {
                                HapticFeedback.lightImpact();
                                _showChunkPopUp(context, chunk, details.globalPosition, language);
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
                          language == AppLanguage.en ? lyric.translation.en : lyric.translation.id,
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
          ),
        ],
      ),
    );
  }

  void _showChunkPopUp(BuildContext context, Chunk chunk, Offset position, AppLanguage language) {
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
                Text(language == AppLanguage.en ? chunk.meaning.en : chunk.meaning.id,
                    style: TextStyle(color: AppColors.textMuted)),
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
