// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_keyword.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedKeyword {
  int get id;
  String get surface;
  String get reading;
  String get meaningEn;
  String get meaningId;
  int get songLyricId;
  String get songTitle;
  String get lineId;
  String get surfaceText;
  ScriptLanguage get language;
  DateTime get savedAt;

  /// Create a copy of SavedKeyword
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedKeywordCopyWith<SavedKeyword> get copyWith =>
      _$SavedKeywordCopyWithImpl<SavedKeyword>(
          this as SavedKeyword, _$identity);

  /// Serializes this SavedKeyword to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedKeyword &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.surface, surface) || other.surface == surface) &&
            (identical(other.reading, reading) || other.reading == reading) &&
            (identical(other.meaningEn, meaningEn) ||
                other.meaningEn == meaningEn) &&
            (identical(other.meaningId, meaningId) ||
                other.meaningId == meaningId) &&
            (identical(other.songLyricId, songLyricId) ||
                other.songLyricId == songLyricId) &&
            (identical(other.songTitle, songTitle) ||
                other.songTitle == songTitle) &&
            (identical(other.lineId, lineId) || other.lineId == lineId) &&
            (identical(other.surfaceText, surfaceText) ||
                other.surfaceText == surfaceText) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      surface,
      reading,
      meaningEn,
      meaningId,
      songLyricId,
      songTitle,
      lineId,
      surfaceText,
      language,
      savedAt);

  @override
  String toString() {
    return 'SavedKeyword(id: $id, surface: $surface, reading: $reading, meaningEn: $meaningEn, meaningId: $meaningId, songLyricId: $songLyricId, songTitle: $songTitle, lineId: $lineId, surfaceText: $surfaceText, language: $language, savedAt: $savedAt)';
  }
}

/// @nodoc
abstract mixin class $SavedKeywordCopyWith<$Res> {
  factory $SavedKeywordCopyWith(
          SavedKeyword value, $Res Function(SavedKeyword) _then) =
      _$SavedKeywordCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String surface,
      String reading,
      String meaningEn,
      String meaningId,
      int songLyricId,
      String songTitle,
      String lineId,
      String surfaceText,
      ScriptLanguage language,
      DateTime savedAt});
}

/// @nodoc
class _$SavedKeywordCopyWithImpl<$Res> implements $SavedKeywordCopyWith<$Res> {
  _$SavedKeywordCopyWithImpl(this._self, this._then);

  final SavedKeyword _self;
  final $Res Function(SavedKeyword) _then;

  /// Create a copy of SavedKeyword
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? surface = null,
    Object? reading = null,
    Object? meaningEn = null,
    Object? meaningId = null,
    Object? songLyricId = null,
    Object? songTitle = null,
    Object? lineId = null,
    Object? surfaceText = null,
    Object? language = null,
    Object? savedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      surface: null == surface
          ? _self.surface
          : surface // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _self.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
      meaningEn: null == meaningEn
          ? _self.meaningEn
          : meaningEn // ignore: cast_nullable_to_non_nullable
              as String,
      meaningId: null == meaningId
          ? _self.meaningId
          : meaningId // ignore: cast_nullable_to_non_nullable
              as String,
      songLyricId: null == songLyricId
          ? _self.songLyricId
          : songLyricId // ignore: cast_nullable_to_non_nullable
              as int,
      songTitle: null == songTitle
          ? _self.songTitle
          : songTitle // ignore: cast_nullable_to_non_nullable
              as String,
      lineId: null == lineId
          ? _self.lineId
          : lineId // ignore: cast_nullable_to_non_nullable
              as String,
      surfaceText: null == surfaceText
          ? _self.surfaceText
          : surfaceText // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as ScriptLanguage,
      savedAt: null == savedAt
          ? _self.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [SavedKeyword].
extension SavedKeywordPatterns on SavedKeyword {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SavedKeyword value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedKeyword() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SavedKeyword value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedKeyword():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SavedKeyword value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedKeyword() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            String surface,
            String reading,
            String meaningEn,
            String meaningId,
            int songLyricId,
            String songTitle,
            String lineId,
            String surfaceText,
            ScriptLanguage language,
            DateTime savedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedKeyword() when $default != null:
        return $default(
            _that.id,
            _that.surface,
            _that.reading,
            _that.meaningEn,
            _that.meaningId,
            _that.songLyricId,
            _that.songTitle,
            _that.lineId,
            _that.surfaceText,
            _that.language,
            _that.savedAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            String surface,
            String reading,
            String meaningEn,
            String meaningId,
            int songLyricId,
            String songTitle,
            String lineId,
            String surfaceText,
            ScriptLanguage language,
            DateTime savedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedKeyword():
        return $default(
            _that.id,
            _that.surface,
            _that.reading,
            _that.meaningEn,
            _that.meaningId,
            _that.songLyricId,
            _that.songTitle,
            _that.lineId,
            _that.surfaceText,
            _that.language,
            _that.savedAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            String surface,
            String reading,
            String meaningEn,
            String meaningId,
            int songLyricId,
            String songTitle,
            String lineId,
            String surfaceText,
            ScriptLanguage language,
            DateTime savedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedKeyword() when $default != null:
        return $default(
            _that.id,
            _that.surface,
            _that.reading,
            _that.meaningEn,
            _that.meaningId,
            _that.songLyricId,
            _that.songTitle,
            _that.lineId,
            _that.surfaceText,
            _that.language,
            _that.savedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SavedKeyword implements SavedKeyword {
  const _SavedKeyword(
      {required this.id,
      required this.surface,
      required this.reading,
      required this.meaningEn,
      required this.meaningId,
      required this.songLyricId,
      required this.songTitle,
      required this.lineId,
      required this.surfaceText,
      required this.language,
      required this.savedAt});
  factory _SavedKeyword.fromJson(Map<String, dynamic> json) =>
      _$SavedKeywordFromJson(json);

  @override
  final int id;
  @override
  final String surface;
  @override
  final String reading;
  @override
  final String meaningEn;
  @override
  final String meaningId;
  @override
  final int songLyricId;
  @override
  final String songTitle;
  @override
  final String lineId;
  @override
  final String surfaceText;
  @override
  final ScriptLanguage language;
  @override
  final DateTime savedAt;

  /// Create a copy of SavedKeyword
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedKeywordCopyWith<_SavedKeyword> get copyWith =>
      __$SavedKeywordCopyWithImpl<_SavedKeyword>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedKeywordToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedKeyword &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.surface, surface) || other.surface == surface) &&
            (identical(other.reading, reading) || other.reading == reading) &&
            (identical(other.meaningEn, meaningEn) ||
                other.meaningEn == meaningEn) &&
            (identical(other.meaningId, meaningId) ||
                other.meaningId == meaningId) &&
            (identical(other.songLyricId, songLyricId) ||
                other.songLyricId == songLyricId) &&
            (identical(other.songTitle, songTitle) ||
                other.songTitle == songTitle) &&
            (identical(other.lineId, lineId) || other.lineId == lineId) &&
            (identical(other.surfaceText, surfaceText) ||
                other.surfaceText == surfaceText) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      surface,
      reading,
      meaningEn,
      meaningId,
      songLyricId,
      songTitle,
      lineId,
      surfaceText,
      language,
      savedAt);

  @override
  String toString() {
    return 'SavedKeyword(id: $id, surface: $surface, reading: $reading, meaningEn: $meaningEn, meaningId: $meaningId, songLyricId: $songLyricId, songTitle: $songTitle, lineId: $lineId, surfaceText: $surfaceText, language: $language, savedAt: $savedAt)';
  }
}

/// @nodoc
abstract mixin class _$SavedKeywordCopyWith<$Res>
    implements $SavedKeywordCopyWith<$Res> {
  factory _$SavedKeywordCopyWith(
          _SavedKeyword value, $Res Function(_SavedKeyword) _then) =
      __$SavedKeywordCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String surface,
      String reading,
      String meaningEn,
      String meaningId,
      int songLyricId,
      String songTitle,
      String lineId,
      String surfaceText,
      ScriptLanguage language,
      DateTime savedAt});
}

/// @nodoc
class __$SavedKeywordCopyWithImpl<$Res>
    implements _$SavedKeywordCopyWith<$Res> {
  __$SavedKeywordCopyWithImpl(this._self, this._then);

  final _SavedKeyword _self;
  final $Res Function(_SavedKeyword) _then;

  /// Create a copy of SavedKeyword
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? surface = null,
    Object? reading = null,
    Object? meaningEn = null,
    Object? meaningId = null,
    Object? songLyricId = null,
    Object? songTitle = null,
    Object? lineId = null,
    Object? surfaceText = null,
    Object? language = null,
    Object? savedAt = null,
  }) {
    return _then(_SavedKeyword(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      surface: null == surface
          ? _self.surface
          : surface // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _self.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
      meaningEn: null == meaningEn
          ? _self.meaningEn
          : meaningEn // ignore: cast_nullable_to_non_nullable
              as String,
      meaningId: null == meaningId
          ? _self.meaningId
          : meaningId // ignore: cast_nullable_to_non_nullable
              as String,
      songLyricId: null == songLyricId
          ? _self.songLyricId
          : songLyricId // ignore: cast_nullable_to_non_nullable
              as int,
      songTitle: null == songTitle
          ? _self.songTitle
          : songTitle // ignore: cast_nullable_to_non_nullable
              as String,
      lineId: null == lineId
          ? _self.lineId
          : lineId // ignore: cast_nullable_to_non_nullable
              as String,
      surfaceText: null == surfaceText
          ? _self.surfaceText
          : surfaceText // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as ScriptLanguage,
      savedAt: null == savedAt
          ? _self.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
