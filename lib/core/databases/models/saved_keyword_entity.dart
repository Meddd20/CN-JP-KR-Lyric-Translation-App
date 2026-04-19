import 'package:Versalex/core/enums/script_language.dart';
import 'package:isar_community/isar.dart';

part 'saved_keyword_entity.g.dart';

@collection
class SavedKeywordEntity {
  Id id = Isar.autoIncrement;

  @Index()
  late String surface;
  late String reading;
  late String meaningEn;
  late String meaningId;
  late int songLyricId;
  late String songTitle;

  @enumerated
  @Index()
  late ScriptLanguage language;

  @Index()
  late DateTime savedAt;
}
