import 'package:Versalex/core/models/global_glossary.dart';
import 'package:Versalex/core/models/lyric.dart';

List<GlobalGlossary> glossaryFromChunk(List<Lyric> lyrics) {
  final seen = <String>[];
  final glossary = <GlobalGlossary>[];

  for (final lyric in lyrics) {
    for (final chunk in lyric.chunks) {
      if (!chunk.isKeyword) continue;

      if (seen.contains(chunk.surface)) continue;

      if (chunk.reading == chunk.surface) continue;

      seen.add(chunk.surface);
      glossary.add(
        GlobalGlossary(
          surface: chunk.surface,
          reading: chunk.reading,
          meaning: chunk.meaning,
        ),
      );
    }
  }

  return glossary;
}
