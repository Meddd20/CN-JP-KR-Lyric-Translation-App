import 'package:cnjpkr_song_lyric_trnslt/core/repositories/lyric_repository.dart';
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

  @override
  void initState() {
    super.initState();
    _urlController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final lyricState = ref.watch(lyricProvider);
    final recentHistory = ref.read(recentHistoryProvider);

    ref.listen(lyricProvider, (previous, next) {
      next.whenOrNull(data: (lyric) {
        if (lyric != null) {
          _urlController.clear();
          context.push('/lyric/detail', extra: lyric);
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
              recentHistory.when(
                error: (e, _) => const SizedBox(),
                loading: () => const SizedBox(),
                data: (lyrics) {
                  if (lyrics.isEmpty) return const SizedBox();

                  return Column(
                    children: [
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
                          itemCount: lyrics.length,
                          itemBuilder: (context, index) {
                            return TrackCard(
                              language: lyrics[index].metadata.scriptLanguage,
                              title: lyrics[index].metadata.title,
                              artist: lyrics[index].metadata.artist,
                              difficulty: lyrics[index].metadata.difficulty,
                              onTap: () => context.push('/lyric/detail', extra: lyrics[index]),
                              youtubeURL: lyrics[index].youtubeURL,
                            );
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
