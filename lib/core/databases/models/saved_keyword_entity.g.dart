// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_keyword_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSavedKeywordEntityCollection on Isar {
  IsarCollection<SavedKeywordEntity> get savedKeywordEntitys =>
      this.collection();
}

const SavedKeywordEntitySchema = CollectionSchema(
  name: r'SavedKeywordEntity',
  id: -8435344882681974910,
  properties: {
    r'language': PropertySchema(
      id: 0,
      name: r'language',
      type: IsarType.byte,
      enumMap: _SavedKeywordEntitylanguageEnumValueMap,
    ),
    r'meaningEn': PropertySchema(
      id: 1,
      name: r'meaningEn',
      type: IsarType.string,
    ),
    r'meaningId': PropertySchema(
      id: 2,
      name: r'meaningId',
      type: IsarType.string,
    ),
    r'reading': PropertySchema(
      id: 3,
      name: r'reading',
      type: IsarType.string,
    ),
    r'savedAt': PropertySchema(
      id: 4,
      name: r'savedAt',
      type: IsarType.dateTime,
    ),
    r'songLyricId': PropertySchema(
      id: 5,
      name: r'songLyricId',
      type: IsarType.long,
    ),
    r'songTitle': PropertySchema(
      id: 6,
      name: r'songTitle',
      type: IsarType.string,
    ),
    r'surface': PropertySchema(
      id: 7,
      name: r'surface',
      type: IsarType.string,
    )
  },
  estimateSize: _savedKeywordEntityEstimateSize,
  serialize: _savedKeywordEntitySerialize,
  deserialize: _savedKeywordEntityDeserialize,
  deserializeProp: _savedKeywordEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'surface': IndexSchema(
      id: 6371273999373086633,
      name: r'surface',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'surface',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'language': IndexSchema(
      id: -1161120539689460177,
      name: r'language',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'language',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'savedAt': IndexSchema(
      id: -5998206549842823851,
      name: r'savedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'savedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _savedKeywordEntityGetId,
  getLinks: _savedKeywordEntityGetLinks,
  attach: _savedKeywordEntityAttach,
  version: '3.3.2',
);

int _savedKeywordEntityEstimateSize(
  SavedKeywordEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.meaningEn.length * 3;
  bytesCount += 3 + object.meaningId.length * 3;
  bytesCount += 3 + object.reading.length * 3;
  bytesCount += 3 + object.songTitle.length * 3;
  bytesCount += 3 + object.surface.length * 3;
  return bytesCount;
}

void _savedKeywordEntitySerialize(
  SavedKeywordEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.language.index);
  writer.writeString(offsets[1], object.meaningEn);
  writer.writeString(offsets[2], object.meaningId);
  writer.writeString(offsets[3], object.reading);
  writer.writeDateTime(offsets[4], object.savedAt);
  writer.writeLong(offsets[5], object.songLyricId);
  writer.writeString(offsets[6], object.songTitle);
  writer.writeString(offsets[7], object.surface);
}

SavedKeywordEntity _savedKeywordEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavedKeywordEntity();
  object.id = id;
  object.language = _SavedKeywordEntitylanguageValueEnumMap[
          reader.readByteOrNull(offsets[0])] ??
      ScriptLanguage.zh;
  object.meaningEn = reader.readString(offsets[1]);
  object.meaningId = reader.readString(offsets[2]);
  object.reading = reader.readString(offsets[3]);
  object.savedAt = reader.readDateTime(offsets[4]);
  object.songLyricId = reader.readLong(offsets[5]);
  object.songTitle = reader.readString(offsets[6]);
  object.surface = reader.readString(offsets[7]);
  return object;
}

P _savedKeywordEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_SavedKeywordEntitylanguageValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ScriptLanguage.zh) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SavedKeywordEntitylanguageEnumValueMap = {
  'zh': 0,
  'ja': 1,
  'ko': 2,
};
const _SavedKeywordEntitylanguageValueEnumMap = {
  0: ScriptLanguage.zh,
  1: ScriptLanguage.ja,
  2: ScriptLanguage.ko,
};

Id _savedKeywordEntityGetId(SavedKeywordEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _savedKeywordEntityGetLinks(
    SavedKeywordEntity object) {
  return [];
}

void _savedKeywordEntityAttach(
    IsarCollection<dynamic> col, Id id, SavedKeywordEntity object) {
  object.id = id;
}

extension SavedKeywordEntityQueryWhereSort
    on QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QWhere> {
  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhere>
      anyLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'language'),
      );
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhere>
      anySavedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'savedAt'),
      );
    });
  }
}

extension SavedKeywordEntityQueryWhere
    on QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QWhereClause> {
  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      surfaceEqualTo(String surface) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'surface',
        value: [surface],
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      surfaceNotEqualTo(String surface) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'surface',
              lower: [],
              upper: [surface],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'surface',
              lower: [surface],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'surface',
              lower: [surface],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'surface',
              lower: [],
              upper: [surface],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      languageEqualTo(ScriptLanguage language) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'language',
        value: [language],
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      languageNotEqualTo(ScriptLanguage language) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'language',
              lower: [],
              upper: [language],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'language',
              lower: [language],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'language',
              lower: [language],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'language',
              lower: [],
              upper: [language],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      languageGreaterThan(
    ScriptLanguage language, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'language',
        lower: [language],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      languageLessThan(
    ScriptLanguage language, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'language',
        lower: [],
        upper: [language],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      languageBetween(
    ScriptLanguage lowerLanguage,
    ScriptLanguage upperLanguage, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'language',
        lower: [lowerLanguage],
        includeLower: includeLower,
        upper: [upperLanguage],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      savedAtEqualTo(DateTime savedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'savedAt',
        value: [savedAt],
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      savedAtNotEqualTo(DateTime savedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'savedAt',
              lower: [],
              upper: [savedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'savedAt',
              lower: [savedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'savedAt',
              lower: [savedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'savedAt',
              lower: [],
              upper: [savedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      savedAtGreaterThan(
    DateTime savedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'savedAt',
        lower: [savedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      savedAtLessThan(
    DateTime savedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'savedAt',
        lower: [],
        upper: [savedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterWhereClause>
      savedAtBetween(
    DateTime lowerSavedAt,
    DateTime upperSavedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'savedAt',
        lower: [lowerSavedAt],
        includeLower: includeLower,
        upper: [upperSavedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SavedKeywordEntityQueryFilter
    on QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QFilterCondition> {
  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      languageEqualTo(ScriptLanguage value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      languageGreaterThan(
    ScriptLanguage value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      languageLessThan(
    ScriptLanguage value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      languageBetween(
    ScriptLanguage lower,
    ScriptLanguage upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningEnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meaningEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'meaningEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'meaningEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'meaningEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'meaningEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'meaningEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningEnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'meaningEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningEnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'meaningEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meaningEn',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'meaningEn',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meaningId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'meaningId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'meaningId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'meaningId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'meaningId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'meaningId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'meaningId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'meaningId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meaningId',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      meaningIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'meaningId',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      readingEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      readingGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      readingLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      readingBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reading',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      readingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      readingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      readingContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reading',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      readingMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reading',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      readingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reading',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      readingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reading',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      savedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'savedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      savedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'savedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      savedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'savedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      savedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'savedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songLyricIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'songLyricId',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songLyricIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'songLyricId',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songLyricIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'songLyricId',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songLyricIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'songLyricId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'songTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'songTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'songTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'songTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'songTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'songTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'songTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'songTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'songTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      songTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'songTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      surfaceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      surfaceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      surfaceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      surfaceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surface',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      surfaceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      surfaceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      surfaceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surface',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      surfaceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surface',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      surfaceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surface',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterFilterCondition>
      surfaceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surface',
        value: '',
      ));
    });
  }
}

extension SavedKeywordEntityQueryObject
    on QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QFilterCondition> {}

extension SavedKeywordEntityQueryLinks
    on QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QFilterCondition> {}

extension SavedKeywordEntityQuerySortBy
    on QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QSortBy> {
  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortByMeaningEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaningEn', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortByMeaningEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaningEn', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortByMeaningId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaningId', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortByMeaningIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaningId', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortByReading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortByReadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortBySavedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAt', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortBySavedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAt', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortBySongLyricId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songLyricId', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortBySongLyricIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songLyricId', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortBySongTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songTitle', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortBySongTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songTitle', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortBySurface() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surface', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      sortBySurfaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surface', Sort.desc);
    });
  }
}

extension SavedKeywordEntityQuerySortThenBy
    on QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QSortThenBy> {
  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenByMeaningEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaningEn', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenByMeaningEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaningEn', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenByMeaningId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaningId', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenByMeaningIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaningId', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenByReading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenByReadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reading', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenBySavedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAt', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenBySavedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAt', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenBySongLyricId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songLyricId', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenBySongLyricIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songLyricId', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenBySongTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songTitle', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenBySongTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songTitle', Sort.desc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenBySurface() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surface', Sort.asc);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QAfterSortBy>
      thenBySurfaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surface', Sort.desc);
    });
  }
}

extension SavedKeywordEntityQueryWhereDistinct
    on QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QDistinct> {
  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QDistinct>
      distinctByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language');
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QDistinct>
      distinctByMeaningEn({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meaningEn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QDistinct>
      distinctByMeaningId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meaningId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QDistinct>
      distinctByReading({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reading', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QDistinct>
      distinctBySavedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'savedAt');
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QDistinct>
      distinctBySongLyricId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songLyricId');
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QDistinct>
      distinctBySongTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QDistinct>
      distinctBySurface({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surface', caseSensitive: caseSensitive);
    });
  }
}

extension SavedKeywordEntityQueryProperty
    on QueryBuilder<SavedKeywordEntity, SavedKeywordEntity, QQueryProperty> {
  QueryBuilder<SavedKeywordEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SavedKeywordEntity, ScriptLanguage, QQueryOperations>
      languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<SavedKeywordEntity, String, QQueryOperations>
      meaningEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meaningEn');
    });
  }

  QueryBuilder<SavedKeywordEntity, String, QQueryOperations>
      meaningIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meaningId');
    });
  }

  QueryBuilder<SavedKeywordEntity, String, QQueryOperations> readingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reading');
    });
  }

  QueryBuilder<SavedKeywordEntity, DateTime, QQueryOperations>
      savedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'savedAt');
    });
  }

  QueryBuilder<SavedKeywordEntity, int, QQueryOperations>
      songLyricIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songLyricId');
    });
  }

  QueryBuilder<SavedKeywordEntity, String, QQueryOperations>
      songTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songTitle');
    });
  }

  QueryBuilder<SavedKeywordEntity, String, QQueryOperations> surfaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surface');
    });
  }
}
