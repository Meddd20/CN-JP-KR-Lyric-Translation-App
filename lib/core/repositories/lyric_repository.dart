import 'dart:convert';

import 'package:cnjpkr_song_lyric_trnslt/core/databases/isar_provider.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/databases/models/song_lyric_entity.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/song_lyric.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/services/gemini_services.dart';
import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lyric_repository.g.dart';

class LyricRepository {
  final GeminiService _service;
  final Isar _isar;
  LyricRepository(this._service, this._isar);

  Future<SongLyric> getLyric(String youtubeURL) async {
    final songLyric = await _service.transcribeLyric(youtubeURL);
    final songLyricWithURL = songLyric.copyWith(youtubeURL: youtubeURL);

    final entity = SongLyricEntity()
      ..youtubeURL = youtubeURL
      ..title = songLyric.metadata.title
      ..artist = songLyric.metadata.artist
      ..scriptLanguage = songLyric.metadata.scriptLanguage.name
      ..difficulty = songLyric.metadata.difficulty.name
      ..tags = songLyric.metadata.tags
      ..rawJson = jsonEncode(songLyric.toJson())
      ..createdAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.songLyricEntitys.put(entity);
    });

    return songLyricWithURL;
  }

  Future<List<SongLyric>> getHistory() async {
    final entities = await _isar.songLyricEntitys.where().sortByCreatedAtDesc().findAll();

    return entities.map((e) => SongLyric.fromJson(jsonDecode(e.rawJson))).toList();
  }

  Future<SongLyric?> getById(int id) async {
    final entity = await _isar.songLyricEntitys.get(id);
    if (entity == null) return null;
    return SongLyric.fromJson(jsonDecode(entity.rawJson));
  }

  Future<void> delete(int id) async {
    await _isar.writeTxn(() async {
      await _isar.songLyricEntitys.delete(id);
    });
  }
}

@riverpod
LyricRepository lyricRepository(Ref ref) {
  return LyricRepository(ref.watch(geminiServiceProvider), ref.watch(isarProvider));
}
