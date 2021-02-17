// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'changed_value_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ChangedValuePairTearOff {
  const _$ChangedValuePairTearOff();

  _ChangedValuePair<T> call<T>({T? current, T? previous}) {
    return _ChangedValuePair<T>(
      current: current,
      previous: previous,
    );
  }
}

/// @nodoc
const $ChangedValuePair = _$ChangedValuePairTearOff();

/// @nodoc
mixin _$ChangedValuePair<T> {
  T? get current;
  T? get previous;

  @JsonKey(ignore: true)
  $ChangedValuePairCopyWith<T, ChangedValuePair<T>> get copyWith;
}

/// @nodoc
abstract class $ChangedValuePairCopyWith<T, $Res> {
  factory $ChangedValuePairCopyWith(
          ChangedValuePair<T> value, $Res Function(ChangedValuePair<T>) then) =
      _$ChangedValuePairCopyWithImpl<T, $Res>;
  $Res call({T? current, T? previous});
}

/// @nodoc
class _$ChangedValuePairCopyWithImpl<T, $Res>
    implements $ChangedValuePairCopyWith<T, $Res> {
  _$ChangedValuePairCopyWithImpl(this._value, this._then);

  final ChangedValuePair<T> _value;
  // ignore: unused_field
  final $Res Function(ChangedValuePair<T>) _then;

  @override
  $Res call({
    Object? current = freezed,
    Object? previous = freezed,
  }) {
    return _then(_value.copyWith(
      current: current == freezed ? _value.current : current as T?,
      previous: previous == freezed ? _value.previous : previous as T?,
    ));
  }
}

/// @nodoc
abstract class _$ChangedValuePairCopyWith<T, $Res>
    implements $ChangedValuePairCopyWith<T, $Res> {
  factory _$ChangedValuePairCopyWith(_ChangedValuePair<T> value,
          $Res Function(_ChangedValuePair<T>) then) =
      __$ChangedValuePairCopyWithImpl<T, $Res>;
  @override
  $Res call({T? current, T? previous});
}

/// @nodoc
class __$ChangedValuePairCopyWithImpl<T, $Res>
    extends _$ChangedValuePairCopyWithImpl<T, $Res>
    implements _$ChangedValuePairCopyWith<T, $Res> {
  __$ChangedValuePairCopyWithImpl(
      _ChangedValuePair<T> _value, $Res Function(_ChangedValuePair<T>) _then)
      : super(_value, (v) => _then(v as _ChangedValuePair<T>));

  @override
  _ChangedValuePair<T> get _value => super._value as _ChangedValuePair<T>;

  @override
  $Res call({
    Object? current = freezed,
    Object? previous = freezed,
  }) {
    return _then(_ChangedValuePair<T>(
      current: current == freezed ? _value.current : current as T?,
      previous: previous == freezed ? _value.previous : previous as T?,
    ));
  }
}

/// @nodoc
class _$_ChangedValuePair<T> implements _ChangedValuePair<T> {
  const _$_ChangedValuePair({this.current, this.previous});

  @override
  final T? current;
  @override
  final T? previous;

  @override
  String toString() {
    return 'ChangedValuePair<$T>(current: $current, previous: $previous)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChangedValuePair<T> &&
            (identical(other.current, current) ||
                const DeepCollectionEquality()
                    .equals(other.current, current)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(current) ^
      const DeepCollectionEquality().hash(previous);

  @JsonKey(ignore: true)
  @override
  _$ChangedValuePairCopyWith<T, _ChangedValuePair<T>> get copyWith =>
      __$ChangedValuePairCopyWithImpl<T, _ChangedValuePair<T>>(
          this, _$identity);
}

abstract class _ChangedValuePair<T> implements ChangedValuePair<T> {
  const factory _ChangedValuePair({T? current, T? previous}) =
      _$_ChangedValuePair<T>;

  @override
  T? get current;
  @override
  T? get previous;
  @override
  @JsonKey(ignore: true)
  _$ChangedValuePairCopyWith<T, _ChangedValuePair<T>> get copyWith;
}
