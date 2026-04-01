// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meaning.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Meaning {

 String get id; String get en;
/// Create a copy of Meaning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeaningCopyWith<Meaning> get copyWith => _$MeaningCopyWithImpl<Meaning>(this as Meaning, _$identity);

  /// Serializes this Meaning to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Meaning&&(identical(other.id, id) || other.id == id)&&(identical(other.en, en) || other.en == en));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,en);

@override
String toString() {
  return 'Meaning(id: $id, en: $en)';
}


}

/// @nodoc
abstract mixin class $MeaningCopyWith<$Res>  {
  factory $MeaningCopyWith(Meaning value, $Res Function(Meaning) _then) = _$MeaningCopyWithImpl;
@useResult
$Res call({
 String id, String en
});




}
/// @nodoc
class _$MeaningCopyWithImpl<$Res>
    implements $MeaningCopyWith<$Res> {
  _$MeaningCopyWithImpl(this._self, this._then);

  final Meaning _self;
  final $Res Function(Meaning) _then;

/// Create a copy of Meaning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? en = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Meaning].
extension MeaningPatterns on Meaning {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Meaning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Meaning() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Meaning value)  $default,){
final _that = this;
switch (_that) {
case _Meaning():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Meaning value)?  $default,){
final _that = this;
switch (_that) {
case _Meaning() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String en)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Meaning() when $default != null:
return $default(_that.id,_that.en);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String en)  $default,) {final _that = this;
switch (_that) {
case _Meaning():
return $default(_that.id,_that.en);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String en)?  $default,) {final _that = this;
switch (_that) {
case _Meaning() when $default != null:
return $default(_that.id,_that.en);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Meaning implements Meaning {
  const _Meaning({required this.id, required this.en});
  factory _Meaning.fromJson(Map<String, dynamic> json) => _$MeaningFromJson(json);

@override final  String id;
@override final  String en;

/// Create a copy of Meaning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeaningCopyWith<_Meaning> get copyWith => __$MeaningCopyWithImpl<_Meaning>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeaningToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Meaning&&(identical(other.id, id) || other.id == id)&&(identical(other.en, en) || other.en == en));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,en);

@override
String toString() {
  return 'Meaning(id: $id, en: $en)';
}


}

/// @nodoc
abstract mixin class _$MeaningCopyWith<$Res> implements $MeaningCopyWith<$Res> {
  factory _$MeaningCopyWith(_Meaning value, $Res Function(_Meaning) _then) = __$MeaningCopyWithImpl;
@override @useResult
$Res call({
 String id, String en
});




}
/// @nodoc
class __$MeaningCopyWithImpl<$Res>
    implements _$MeaningCopyWith<$Res> {
  __$MeaningCopyWithImpl(this._self, this._then);

  final _Meaning _self;
  final $Res Function(_Meaning) _then;

/// Create a copy of Meaning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? en = null,}) {
  return _then(_Meaning(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
