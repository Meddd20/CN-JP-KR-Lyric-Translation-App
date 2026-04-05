import 'package:cnjpkr_song_lyric_trnslt/core/enums/difficulty.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/enums/script_language.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/helpers/difficulty_color.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/helpers/language_color.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/helpers/language_flag.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/metadata.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/song_lyric.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/logic/lyric_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _urlController = TextEditingController();
  final _dummyLyrics = [
    SongLyric(
      metadata: Metadata(
        title: 'Love Poem',
        artist: 'IU',
        scriptLanguage: ScriptLanguage.ko,
        difficulty: Difficulty.intermediate,
        tags: ['love', 'ballad'],
      ),
      globalGlossary: [],
      lyrics: [],
    ),
    SongLyric(
      metadata: Metadata(
        title: 'Stay With Me',
        artist: 'Miki Matsubara',
        scriptLanguage: ScriptLanguage.ja,
        difficulty: Difficulty.advanced,
        tags: ['city pop', 'classic'],
      ),
      globalGlossary: [],
      lyrics: [],
    ),
    SongLyric(
      metadata: Metadata(
        title: '然后我们一起看烟花',
        artist: 'Bell玲惠',
        scriptLanguage: ScriptLanguage.zh,
        difficulty: Difficulty.intermediate,
        tags: ['romance', 'ballad'],
      ),
      globalGlossary: [],
      lyrics: [],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _urlController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(lyricProvider, (previous, next) {
      next.whenOrNull(data: (lyric) {
        if (lyric != null) {
          _urlController.clear();
          context.push('/lyric/detail');
        }
      }, error: (e, _) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.w600),
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        centerTitle: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              context.push('/history');
            },
            icon: Icon(Icons.list),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Transcribe your Songs",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 8),
              Text("Chinese, Japanese, and Korean",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              TextField(
                controller: _urlController,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  hintText: 'https://youtube.com/watch?v=...',
                  hintStyle: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 13,
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                  suffixIcon: IconButton(
                    onPressed: () async {
                      if (_urlController.text.isEmpty) {
                        final clipboard = await Clipboard.getData(Clipboard.kTextPlain);
                        if (clipboard?.text != null) {
                          _urlController.text = clipboard!.text!;
                          ref.read(lyricProvider.notifier).transcribe(_urlController.text);
                        }
                      } else {
                        _urlController.clear();
                      }
                    },
                    icon: Icon(_urlController.text.isEmpty ? Icons.link : Icons.clear),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(lyricProvider.notifier).transcribe(_urlController.text);
                  },
                  child: Text(
                    "Generate",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Sessions",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    languageFlag(_dummyLyrics[index].metadata.scriptLanguage),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    _dummyLyrics[index].metadata.scriptLanguage.name.toUpperCase(),
                                    style:
                                        Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textPrimary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // const Spacer(),
                          Expanded(
                            child: Center(
                              child: Text(
                                _dummyLyrics[index].metadata.title[0],
                                style: TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withValues(alpha: 0.05),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            _dummyLyrics[index].metadata.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            _dummyLyrics[index].metadata.artist,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                                color: difficultyColor(_dummyLyrics[index].metadata.difficulty),
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              _dummyLyrics[index].metadata.difficulty.name.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.textPrimary, fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
