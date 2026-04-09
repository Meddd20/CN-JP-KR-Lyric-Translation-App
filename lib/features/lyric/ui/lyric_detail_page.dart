import 'dart:async';

import 'package:cnjpkr_song_lyric_trnslt/core/enums/difficulty.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/enums/script_language.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/chunk.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/global_glossary.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/lyric.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/meaning.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/metadata.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/saved_keyword.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/song_lyric.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/repositories/saved_keyword_repository.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/logic/lyric_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LyricDetailPage extends ConsumerStatefulWidget {
  final String lyricId;
  const LyricDetailPage({super.key, required this.lyricId});

  @override
  ConsumerState<LyricDetailPage> createState() => _LyricDetailPageState();
}

class _LyricDetailPageState extends ConsumerState<LyricDetailPage> {
  late YoutubePlayerController _youtubePlayerController;
  Timer? _menuTimer;
  OverlayEntry? _overlayEntry;

  final _dummyLyric = SongLyric(
    youtubeURL: "https://www.youtube.com/watch?v=dSyQSd0PSsU",
    metadata: Metadata(
      title: '然后我们一起看烟花',
      artist: 'Bell玲惠',
      scriptLanguage: ScriptLanguage.zh,
      difficulty: Difficulty.intermediate,
      tags: ['romance', 'ballad', 'fireworks', 'longing'],
    ),
    globalGlossary: [
      GlobalGlossary(
        surface: "烟花",
        reading: "yān huā",
        meaning: Meaning(id: "kembang api", en: "fireworks"),
      ),
      GlobalGlossary(
        surface: "灿烂",
        reading: "càn làn",
        meaning: Meaning(id: "brilian/cemerlang", en: "brilliant/splendid"),
      ),
      GlobalGlossary(
        surface: "瞬间",
        reading: "shùn jiān",
        meaning: Meaning(id: "sekejap", en: "moment/instant"),
      ),
      GlobalGlossary(
        surface: "坦白",
        reading: "tǎn bái",
        meaning: Meaning(id: "mengaku/jujur", en: "to confess/honest"),
      ),
      GlobalGlossary(
        surface: "闪烁",
        reading: "shǎn shuò",
        meaning: Meaning(id: "berkelap-kelip", en: "to twinkle/flicker"),
      ),
      GlobalGlossary(
        surface: "缘分",
        reading: "yuán fèn",
        meaning: Meaning(id: "takdir (hubungan)", en: "fate/destiny"),
      ),
    ],
    lyrics: [
      Lyric(
        lineId: "l1",
        startTime: 10.50,
        endTime: 15.20,
        surfaceText: "深夜的烟火 灿烂却无法触摸",
        readingText: "shēn yè de yān huǒ càn làn què wú fǎ chù mō",
        translation: Meaning(
          id: "Kembang api di larut malam, begitu cemerlang namun tak tersentuh",
          en: "Midnight fireworks, brilliant yet untouchable",
        ),
        chunks: [
          Chunk(
              surface: "深夜",
              reading: "shēn yè",
              meaning: Meaning(en: "late night", id: "larut malam"),
              isKeyword: true),
          Chunk(surface: "的", reading: "de", meaning: Meaning(en: "particle", id: "partikel"), isKeyword: false),
          Chunk(
              surface: "烟火", reading: "yān huǒ", meaning: Meaning(en: "fireworks", id: "kembang api"), isKeyword: true),
          Chunk(surface: " ", reading: "", meaning: Meaning(en: "", id: ""), isKeyword: false),
          Chunk(surface: "灿烂", reading: "càn làn", meaning: Meaning(en: "brilliant", id: "cemerlang"), isKeyword: true),
          Chunk(surface: "却", reading: "què", meaning: Meaning(en: "but", id: "namun"), isKeyword: false),
          Chunk(surface: "无法", reading: "wú fǎ", meaning: Meaning(en: "unable", id: "tidak bisa"), isKeyword: true),
          Chunk(surface: "触摸", reading: "chù mō", meaning: Meaning(en: "to touch", id: "menyentuh"), isKeyword: true),
        ],
      ),
      Lyric(
        lineId: "l2",
        startTime: 16.30,
        endTime: 22.80,
        surfaceText: "我瞥见你侧脸 被击中在夜空边缘",
        readingText: "wǒ piē jiàn nǐ cè liǎn  bèi jī zhòng zài yè kōng biān yuán",
        translation: Meaning(
          id: "Aku melirik profil wajahmu, terpaku di tepi langit malam",
          en: "I glimpsed your profile, struck at the edge of the night sky",
        ),
        chunks: [
          Chunk(surface: "我", reading: "wǒ", meaning: Meaning(en: "I", id: "aku"), isKeyword: false),
          Chunk(surface: "瞥见", reading: "piē jiàn", meaning: Meaning(en: "glimpse", id: "melirik"), isKeyword: true),
          Chunk(surface: "你", reading: "nǐ", meaning: Meaning(en: "you", id: "kamu"), isKeyword: false),
          Chunk(
              surface: "侧脸",
              reading: "cè liǎn",
              meaning: Meaning(en: "profile/side face", id: "profil wajah"),
              isKeyword: true),
          Chunk(surface: " ", reading: "", meaning: Meaning(en: "", id: ""), isKeyword: false),
          Chunk(
              surface: "被",
              reading: "bèi",
              meaning: Meaning(en: "passive marker", id: "penanda pasif"),
              isKeyword: false),
          Chunk(
              surface: "击中",
              reading: "jī zhòng",
              meaning: Meaning(en: "to hit/strike", id: "terpukul"),
              isKeyword: true),
          Chunk(surface: "在", reading: "zài", meaning: Meaning(en: "at", id: "di"), isKeyword: false),
          Chunk(
              surface: "夜空",
              reading: "yè kōng",
              meaning: Meaning(en: "night sky", id: "langit malam"),
              isKeyword: true),
          Chunk(surface: "边缘", reading: "biān yuán", meaning: Meaning(en: "edge", id: "tepi"), isKeyword: true),
        ],
      ),
      Lyric(
        lineId: "l3",
        startTime: 23.50,
        endTime: 28.60,
        surfaceText: "星落下瞬间 许下有关你的愿",
        readingText: "xīng luò xià shùn jiān  xǔ xià yǒu guān nǐ de yuàn",
        translation: Meaning(
          id: "Di saat bintang jatuh, aku mengucap keinginan tentangmu",
          en: "The moment a star falls, I make a wish about you",
        ),
        chunks: [
          Chunk(surface: "星", reading: "xīng", meaning: Meaning(en: "star", id: "bintang"), isKeyword: true),
          Chunk(surface: "落下", reading: "luò xià", meaning: Meaning(en: "fall", id: "jatuh"), isKeyword: true),
          Chunk(surface: "瞬间", reading: "shùn jiān", meaning: Meaning(en: "moment", id: "sekejap"), isKeyword: true),
          Chunk(surface: " ", reading: "", meaning: Meaning(en: "", id: ""), isKeyword: false),
          Chunk(
              surface: "许下",
              reading: "xǔ xià",
              meaning: Meaning(en: "make a wish", id: "mengucap keinginan"),
              isKeyword: true),
          Chunk(surface: "有关", reading: "yǒu guān", meaning: Meaning(en: "related to", id: "tentang"), isKeyword: true),
          Chunk(surface: "你", reading: "nǐ", meaning: Meaning(en: "you", id: "kamu"), isKeyword: false),
          Chunk(surface: "的", reading: "de", meaning: Meaning(en: "particle", id: "partikel"), isKeyword: false),
          Chunk(surface: "愿", reading: "yuàn", meaning: Meaning(en: "wish", id: "keinginan"), isKeyword: true),
        ],
      ),
    ],
  );

  @override
  void initState() {
    super.initState();

    final lyric = ref.read(lyricProvider).value;
    final videoId = YoutubePlayer.convertUrlToId(lyric?.youtubeURL ?? "") ?? "dQw4w9WgXcQ";

    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    _menuTimer?.cancel();
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              player,
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  itemCount: _dummyLyric.lyrics.length,
                  itemBuilder: (context, index) {
                    var lyric = _dummyLyric.lyrics[index];
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
                                                              songLyricId: 0,
                                                              songTitle: '',
                                                              lineId: lyric.lineId,
                                                              surfaceText: lyric.surfaceText,
                                                              language: ScriptLanguage.ja,
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
                            children: lyric.chunks.map((chunk) {
                              if (chunk.reading.isEmpty) {
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

    double dx = position.dx < screenSize.width / 2
        ? position.dx // tap di kiri → popup mulai dari sini ke kanan
        : position.dx - 100;

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
