import 'package:isar_community/isar.dart';

part 'song_lyric_entity.g.dart';

@collection
class SongLyricEntity {
  Id id = Isar.autoIncrement;

  late String youtubeURL;
  late String title;
  late String artist;
  late String scriptLanguage;
  late String difficulty;
  late List<String> tags;
  late DateTime createdAt;

  late String rawJson;
}
