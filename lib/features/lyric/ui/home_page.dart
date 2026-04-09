import 'package:cnjpkr_song_lyric_trnslt/core/enums/difficulty.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/enums/script_language.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/metadata.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/song_lyric.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/logic/lyric_notifier.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/ui/widgets/generate_button.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/ui/widgets/track_card.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/ui/widgets/url_textfield.dart';
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
      youtubeURL: "https://youtu.be/X918-0Ps8XY?si=rQpW4-2UmT37BE5J",
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
      youtubeURL: "https://youtu.be/X918-0Ps8XY?si=rQpW4-2UmT37BE5J",
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
      youtubeURL: "https://youtu.be/X918-0Ps8XY?si=rQpW4-2UmT37BE5J",
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
    final lyricState = ref.watch(lyricProvider);

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
              UrlTextfield(
                urlController: _urlController,
                suffixIconOnpressed: () async {
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
                isEmpty: _urlController.text.isEmpty,
              ),
              const SizedBox(height: 16),
              GenerateButton(
                isLoading: lyricState.isLoading,
                onPressed: () {
                  ref.read(lyricProvider.notifier).transcribe(_urlController.text);
                },
              ),
              const SizedBox(height: 30),
              if (_dummyLyrics.isNotEmpty) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Sessions",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        context.push('/history');
                      },
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
                      return TrackCard(
                        language: _dummyLyrics[index].metadata.scriptLanguage,
                        title: _dummyLyrics[index].metadata.title,
                        artist: _dummyLyrics[index].metadata.artist,
                        difficulty: _dummyLyrics[index].metadata.difficulty,
                        onTap: () => context.push('/lyric/123'),
                        youtubeURL: _dummyLyrics[index].youtubeURL,
                      );
                    },
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
