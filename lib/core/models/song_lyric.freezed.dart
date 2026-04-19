// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_lyric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongLyric {
  int get isarId;
  String get youtubeURL;
  Metadata get metadata;
  @JsonKey(name: 'global_glossary', defaultValue: [])
  List<GlobalGlossary> get globalGlossary;
  List<Lyric> get lyrics;
  DateTime get createdAt;

  /// Create a copy of SongLyric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SongLyricCopyWith<SongLyric> get copyWith =>
      _$SongLyricCopyWithImpl<SongLyric>(this as SongLyric, _$identity);

  /// Serializes this SongLyric to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SongLyric &&
            (identical(other.isarId, isarId) || other.isarId == isarId) &&
            (identical(other.youtubeURL, youtubeURL) ||
                other.youtubeURL == youtubeURL) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other.globalGlossary, globalGlossary) &&
            const DeepCollectionEquality().equals(other.lyrics, lyrics) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isarId,
      youtubeURL,
      metadata,
      const DeepCollectionEquality().hash(globalGlossary),
      const DeepCollectionEquality().hash(lyrics),
      createdAt);

  @override
  String toString() {
    return 'SongLyric(isarId: $isarId, youtubeURL: $youtubeURL, metadata: $metadata, globalGlossary: $globalGlossary, lyrics: $lyrics, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $SongLyricCopyWith<$Res> {
  factory $SongLyricCopyWith(SongLyric value, $Res Function(SongLyric) _then) =
      _$SongLyricCopyWithImpl;
  @useResult
  $Res call(
      {int isarId,
      String youtubeURL,
      Metadata metadata,
      @JsonKey(name: 'global_glossary', defaultValue: [])
      List<GlobalGlossary> globalGlossary,
      List<Lyric> lyrics,
      DateTime createdAt});

  $MetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$SongLyricCopyWithImpl<$Res> implements $SongLyricCopyWith<$Res> {
  _$SongLyricCopyWithImpl(this._self, this._then);

  final SongLyric _self;
  final $Res Function(SongLyric) _then;

  /// Create a copy of SongLyric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isarId = null,
    Object? youtubeURL = null,
    Object? metadata = null,
    Object? globalGlossary = null,
    Object? lyrics = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      isarId: null == isarId
          ? _self.isarId
          : isarId // ignore: cast_nullable_to_non_nullable
              as int,
      youtubeURL: null == youtubeURL
          ? _self.youtubeURL
          : youtubeURL // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata,
      globalGlossary: null == globalGlossary
          ? _self.globalGlossary
          : globalGlossary // ignore: cast_nullable_to_non_nullable
              as List<GlobalGlossary>,
      lyrics: null == lyrics
          ? _self.lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as List<Lyric>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of SongLyric
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetadataCopyWith<$Res> get metadata {
    return $MetadataCopyWith<$Res>(_self.metadata, (value) {
      return _then(_self.copyWith(metadata: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SongLyric].
extension SongLyricPatterns on SongLyric {
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
    TResult Function(_SongLyric value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongLyric() when $default != null:
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
    TResult Function(_SongLyric value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyric():
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
    TResult? Function(_SongLyric value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyric() when $default != null:
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
            int isarId,
            String youtubeURL,
            Metadata metadata,
            @JsonKey(name: 'global_glossary', defaultValue: [])
            List<GlobalGlossary> globalGlossary,
            List<Lyric> lyrics,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongLyric() when $default != null:
        return $default(_that.isarId, _that.youtubeURL, _that.metadata,
            _that.globalGlossary, _that.lyrics, _that.createdAt);
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
            int isarId,
            String youtubeURL,
            Metadata metadata,
            @JsonKey(name: 'global_glossary', defaultValue: [])
            List<GlobalGlossary> globalGlossary,
            List<Lyric> lyrics,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyric():
        return $default(_that.isarId, _that.youtubeURL, _that.metadata,
            _that.globalGlossary, _that.lyrics, _that.createdAt);
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
            int isarId,
            String youtubeURL,
            Metadata metadata,
            @JsonKey(name: 'global_glossary', defaultValue: [])
            List<GlobalGlossary> globalGlossary,
            List<Lyric> lyrics,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyric() when $default != null:
        return $default(_that.isarId, _that.youtubeURL, _that.metadata,
            _that.globalGlossary, _that.lyrics, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SongLyric implements SongLyric {
  const _SongLyric(
      {this.isarId = 0,
      required this.youtubeURL,
      required this.metadata,
      @JsonKey(name: 'global_glossary', defaultValue: [])
      required final List<GlobalGlossary> globalGlossary,
      required final List<Lyric> lyrics,
      required this.createdAt})
      : _globalGlossary = globalGlossary,
        _lyrics = lyrics;
  factory _SongLyric.fromJson(Map<String, dynamic> json) =>
      _$SongLyricFromJson(json);

  @override
  @JsonKey()
  final int isarId;
  @override
  final String youtubeURL;
  @override
  final Metadata metadata;
  final List<GlobalGlossary> _globalGlossary;
  @override
  @JsonKey(name: 'global_glossary', defaultValue: [])
  List<GlobalGlossary> get globalGlossary {
    if (_globalGlossary is EqualUnmodifiableListView) return _globalGlossary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_globalGlossary);
  }

  final List<Lyric> _lyrics;
  @override
  List<Lyric> get lyrics {
    if (_lyrics is EqualUnmodifiableListView) return _lyrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lyrics);
  }

  @override
  final DateTime createdAt;

  /// Create a copy of SongLyric
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SongLyricCopyWith<_SongLyric> get copyWith =>
      __$SongLyricCopyWithImpl<_SongLyric>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SongLyricToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SongLyric &&
            (identical(other.isarId, isarId) || other.isarId == isarId) &&
            (identical(other.youtubeURL, youtubeURL) ||
                other.youtubeURL == youtubeURL) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other._globalGlossary, _globalGlossary) &&
            const DeepCollectionEquality().equals(other._lyrics, _lyrics) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isarId,
      youtubeURL,
      metadata,
      const DeepCollectionEquality().hash(_globalGlossary),
      const DeepCollectionEquality().hash(_lyrics),
      createdAt);

  @override
  String toString() {
    return 'SongLyric(isarId: $isarId, youtubeURL: $youtubeURL, metadata: $metadata, globalGlossary: $globalGlossary, lyrics: $lyrics, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$SongLyricCopyWith<$Res>
    implements $SongLyricCopyWith<$Res> {
  factory _$SongLyricCopyWith(
          _SongLyric value, $Res Function(_SongLyric) _then) =
      __$SongLyricCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int isarId,
      String youtubeURL,
      Metadata metadata,
      @JsonKey(name: 'global_glossary', defaultValue: [])
      List<GlobalGlossary> globalGlossary,
      List<Lyric> lyrics,
      DateTime createdAt});

  @override
  $MetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$SongLyricCopyWithImpl<$Res> implements _$SongLyricCopyWith<$Res> {
  __$SongLyricCopyWithImpl(this._self, this._then);

  final _SongLyric _self;
  final $Res Function(_SongLyric) _then;

  /// Create a copy of SongLyric
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isarId = null,
    Object? youtubeURL = null,
    Object? metadata = null,
    Object? globalGlossary = null,
    Object? lyrics = null,
    Object? createdAt = null,
  }) {
    return _then(_SongLyric(
      isarId: null == isarId
          ? _self.isarId
          : isarId // ignore: cast_nullable_to_non_nullable
              as int,
      youtubeURL: null == youtubeURL
          ? _self.youtubeURL
          : youtubeURL // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata,
      globalGlossary: null == globalGlossary
          ? _self._globalGlossary
          : globalGlossary // ignore: cast_nullable_to_non_nullable
              as List<GlobalGlossary>,
      lyrics: null == lyrics
          ? _self._lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as List<Lyric>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of SongLyric
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetadataCopyWith<$Res> get metadata {
    return $MetadataCopyWith<$Res>(_self.metadata, (value) {
      return _then(_self.copyWith(metadata: value));
    });
  }
}

// dart format on
