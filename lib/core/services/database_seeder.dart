import 'dart:convert';

import 'package:Versalex/core/data/dummy_data.dart';
import 'package:Versalex/core/databases/models/song_lyric_entity.dart';
import 'package:Versalex/core/helpers/glossary_from_chunk.dart';
import 'package:Versalex/core/models/song_lyric.dart';
import 'package:isar_community/isar.dart';

class DatabaseSeeder {
  static Future<void> seedIfEmpty(Isar isar) async {
    final count = await isar.songLyricEntitys.count();
    if (count > 0) return;

    final Map<String, String> songUrls = {
      "最好的我": "https://youtu.be/0zmmHNGHRds?si=JtTbXSeGQ9-gIT-2",
      "你，好不好？": "https://youtu.be/wSBXfzgqHtE?si=NsFQTinUatzoJoz2",
    };

    await isar.writeTxn(() async {
      for (final song in dummySongs) {
        final url = songUrls[song["metadata"]["title"]] ?? "https://www.youtube.com/watch?v=demo";

        final lyric = SongLyric.fromJson({
          ...song,
          "youtubeURL": url,
          "createdAt": DateTime.now().toIso8601String(),
        });
        final lyricWithGlossary = lyric.copyWith(
          globalGlossary: glossaryFromChunk(lyric.lyrics),
        );

        final entity = SongLyricEntity()
          ..youtubeURL = lyricWithGlossary.youtubeURL
          ..title = lyricWithGlossary.metadata.title
          ..artist = lyricWithGlossary.metadata.artist
          ..scriptLanguage = lyricWithGlossary.metadata.scriptLanguage.name
          ..difficulty = lyricWithGlossary.metadata.difficulty.name
          ..tags = lyricWithGlossary.metadata.tags
          ..createdAt = lyricWithGlossary.createdAt
          ..rawJson = jsonEncode(lyricWithGlossary.toJson());

        await isar.songLyricEntitys.put(entity);
      }
    });
  }
}
