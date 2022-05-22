// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataState<D, F> {
  DataStatus? get dataStatus => throw _privateConstructorUsedError;
  D? get data => throw _privateConstructorUsedError;
  F? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataStateCopyWith<D, F, DataState<D, F>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataStateCopyWith<D, F, $Res> {
  factory $DataStateCopyWith(
          DataState<D, F> value, $Res Function(DataState<D, F>) then) =
      _$DataStateCopyWithImpl<D, F, $Res>;
  $Res call({DataStatus? dataStatus, D? data, F? failure});
}

/// @nodoc
class _$DataStateCopyWithImpl<D, F, $Res>
    implements $DataStateCopyWith<D, F, $Res> {
  _$DataStateCopyWithImpl(this._value, this._then);

  final DataState<D, F> _value;
  // ignore: unused_field
  final $Res Function(DataState<D, F>) _then;

  @override
  $Res call({
    Object? dataStatus = freezed,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      dataStatus: dataStatus == freezed
          ? _value.dataStatus
          : dataStatus // ignore: cast_nullable_to_non_nullable
              as DataStatus?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as D?,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as F?,
    ));
  }
}

/// @nodoc
abstract class _$$_DataStateCopyWith<D, F, $Res>
    implements $DataStateCopyWith<D, F, $Res> {
  factory _$$_DataStateCopyWith(
          _$_DataState<D, F> value, $Res Function(_$_DataState<D, F>) then) =
      __$$_DataStateCopyWithImpl<D, F, $Res>;
  @override
  $Res call({DataStatus? dataStatus, D? data, F? failure});
}

/// @nodoc
class __$$_DataStateCopyWithImpl<D, F, $Res>
    extends _$DataStateCopyWithImpl<D, F, $Res>
    implements _$$_DataStateCopyWith<D, F, $Res> {
  __$$_DataStateCopyWithImpl(
      _$_DataState<D, F> _value, $Res Function(_$_DataState<D, F>) _then)
      : super(_value, (v) => _then(v as _$_DataState<D, F>));

  @override
  _$_DataState<D, F> get _value => super._value as _$_DataState<D, F>;

  @override
  $Res call({
    Object? dataStatus = freezed,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_DataState<D, F>(
      dataStatus: dataStatus == freezed
          ? _value.dataStatus
          : dataStatus // ignore: cast_nullable_to_non_nullable
              as DataStatus?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as D?,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as F?,
    ));
  }
}

/// @nodoc

class _$_DataState<D, F> extends _DataState<D, F> {
  const _$_DataState({this.dataStatus, this.data, this.failure}) : super._();

  @override
  final DataStatus? dataStatus;
  @override
  final D? data;
  @override
  final F? failure;

  @override
  String toString() {
    return 'DataState<$D, $F>(dataStatus: $dataStatus, data: $data, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataState<D, F> &&
            const DeepCollectionEquality()
                .equals(other.dataStatus, dataStatus) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dataStatus),
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$_DataStateCopyWith<D, F, _$_DataState<D, F>> get copyWith =>
      __$$_DataStateCopyWithImpl<D, F, _$_DataState<D, F>>(this, _$identity);
}

abstract class _DataState<D, F> extends DataState<D, F> {
  const factory _DataState(
      {final DataStatus? dataStatus,
      final D? data,
      final F? failure}) = _$_DataState<D, F>;
  const _DataState._() : super._();

  @override
  DataStatus? get dataStatus => throw _privateConstructorUsedError;
  @override
  D? get data => throw _privateConstructorUsedError;
  @override
  F? get failure => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DataStateCopyWith<D, F, _$_DataState<D, F>> get copyWith =>
      throw _privateConstructorUsedError;
}
