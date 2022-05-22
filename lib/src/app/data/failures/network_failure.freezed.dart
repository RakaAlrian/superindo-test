// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorCode, String message) server,
    required TResult Function() timeout,
    required TResult Function() unconnected,
    required TResult Function(String message) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String errorCode, String message)? server,
    TResult Function()? timeout,
    TResult Function()? unconnected,
    TResult Function(String message)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorCode, String message)? server,
    TResult Function()? timeout,
    TResult Function()? unconnected,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_server value) server,
    required TResult Function(_timeout value) timeout,
    required TResult Function(_unconnected value) unconnected,
    required TResult Function(_unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_server value)? server,
    TResult Function(_timeout value)? timeout,
    TResult Function(_unconnected value)? unconnected,
    TResult Function(_unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_server value)? server,
    TResult Function(_timeout value)? timeout,
    TResult Function(_unconnected value)? unconnected,
    TResult Function(_unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkFailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(
          NetworkFailure value, $Res Function(NetworkFailure) then) =
      _$NetworkFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._value, this._then);

  final NetworkFailure _value;
  // ignore: unused_field
  final $Res Function(NetworkFailure) _then;
}

/// @nodoc
abstract class _$$_serverCopyWith<$Res> {
  factory _$$_serverCopyWith(_$_server value, $Res Function(_$_server) then) =
      __$$_serverCopyWithImpl<$Res>;
  $Res call({String errorCode, String message});
}

/// @nodoc
class __$$_serverCopyWithImpl<$Res> extends _$NetworkFailureCopyWithImpl<$Res>
    implements _$$_serverCopyWith<$Res> {
  __$$_serverCopyWithImpl(_$_server _value, $Res Function(_$_server) _then)
      : super(_value, (v) => _then(v as _$_server));

  @override
  _$_server get _value => super._value as _$_server;

  @override
  $Res call({
    Object? errorCode = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_server(
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_server implements _server {
  const _$_server({this.errorCode = "", this.message = ""});

  @override
  @JsonKey()
  final String errorCode;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NetworkFailure.server(errorCode: $errorCode, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_server &&
            const DeepCollectionEquality().equals(other.errorCode, errorCode) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(errorCode),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_serverCopyWith<_$_server> get copyWith =>
      __$$_serverCopyWithImpl<_$_server>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorCode, String message) server,
    required TResult Function() timeout,
    required TResult Function() unconnected,
    required TResult Function(String message) unknown,
  }) {
    return server(errorCode, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String errorCode, String message)? server,
    TResult Function()? timeout,
    TResult Function()? unconnected,
    TResult Function(String message)? unknown,
  }) {
    return server?.call(errorCode, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorCode, String message)? server,
    TResult Function()? timeout,
    TResult Function()? unconnected,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(errorCode, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_server value) server,
    required TResult Function(_timeout value) timeout,
    required TResult Function(_unconnected value) unconnected,
    required TResult Function(_unknown value) unknown,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_server value)? server,
    TResult Function(_timeout value)? timeout,
    TResult Function(_unconnected value)? unconnected,
    TResult Function(_unknown value)? unknown,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_server value)? server,
    TResult Function(_timeout value)? timeout,
    TResult Function(_unconnected value)? unconnected,
    TResult Function(_unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class _server implements NetworkFailure {
  const factory _server({final String errorCode, final String message}) =
      _$_server;

  String get errorCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_serverCopyWith<_$_server> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_timeoutCopyWith<$Res> {
  factory _$$_timeoutCopyWith(
          _$_timeout value, $Res Function(_$_timeout) then) =
      __$$_timeoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_timeoutCopyWithImpl<$Res> extends _$NetworkFailureCopyWithImpl<$Res>
    implements _$$_timeoutCopyWith<$Res> {
  __$$_timeoutCopyWithImpl(_$_timeout _value, $Res Function(_$_timeout) _then)
      : super(_value, (v) => _then(v as _$_timeout));

  @override
  _$_timeout get _value => super._value as _$_timeout;
}

/// @nodoc

class _$_timeout implements _timeout {
  const _$_timeout();

  @override
  String toString() {
    return 'NetworkFailure.timeout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_timeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorCode, String message) server,
    required TResult Function() timeout,
    required TResult Function() unconnected,
    required TResult Function(String message) unknown,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String errorCode, String message)? server,
    TResult Function()? timeout,
    TResult Function()? unconnected,
    TResult Function(String message)? unknown,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorCode, String message)? server,
    TResult Function()? timeout,
    TResult Function()? unconnected,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_server value) server,
    required TResult Function(_timeout value) timeout,
    required TResult Function(_unconnected value) unconnected,
    required TResult Function(_unknown value) unknown,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_server value)? server,
    TResult Function(_timeout value)? timeout,
    TResult Function(_unconnected value)? unconnected,
    TResult Function(_unknown value)? unknown,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_server value)? server,
    TResult Function(_timeout value)? timeout,
    TResult Function(_unconnected value)? unconnected,
    TResult Function(_unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class _timeout implements NetworkFailure {
  const factory _timeout() = _$_timeout;
}

/// @nodoc
abstract class _$$_unconnectedCopyWith<$Res> {
  factory _$$_unconnectedCopyWith(
          _$_unconnected value, $Res Function(_$_unconnected) then) =
      __$$_unconnectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_unconnectedCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res>
    implements _$$_unconnectedCopyWith<$Res> {
  __$$_unconnectedCopyWithImpl(
      _$_unconnected _value, $Res Function(_$_unconnected) _then)
      : super(_value, (v) => _then(v as _$_unconnected));

  @override
  _$_unconnected get _value => super._value as _$_unconnected;
}

/// @nodoc

class _$_unconnected implements _unconnected {
  const _$_unconnected();

  @override
  String toString() {
    return 'NetworkFailure.unconnected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_unconnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorCode, String message) server,
    required TResult Function() timeout,
    required TResult Function() unconnected,
    required TResult Function(String message) unknown,
  }) {
    return unconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String errorCode, String message)? server,
    TResult Function()? timeout,
    TResult Function()? unconnected,
    TResult Function(String message)? unknown,
  }) {
    return unconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorCode, String message)? server,
    TResult Function()? timeout,
    TResult Function()? unconnected,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unconnected != null) {
      return unconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_server value) server,
    required TResult Function(_timeout value) timeout,
    required TResult Function(_unconnected value) unconnected,
    required TResult Function(_unknown value) unknown,
  }) {
    return unconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_server value)? server,
    TResult Function(_timeout value)? timeout,
    TResult Function(_unconnected value)? unconnected,
    TResult Function(_unknown value)? unknown,
  }) {
    return unconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_server value)? server,
    TResult Function(_timeout value)? timeout,
    TResult Function(_unconnected value)? unconnected,
    TResult Function(_unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unconnected != null) {
      return unconnected(this);
    }
    return orElse();
  }
}

abstract class _unconnected implements NetworkFailure {
  const factory _unconnected() = _$_unconnected;
}

/// @nodoc
abstract class _$$_unknownCopyWith<$Res> {
  factory _$$_unknownCopyWith(
          _$_unknown value, $Res Function(_$_unknown) then) =
      __$$_unknownCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$_unknownCopyWithImpl<$Res> extends _$NetworkFailureCopyWithImpl<$Res>
    implements _$$_unknownCopyWith<$Res> {
  __$$_unknownCopyWithImpl(_$_unknown _value, $Res Function(_$_unknown) _then)
      : super(_value, (v) => _then(v as _$_unknown));

  @override
  _$_unknown get _value => super._value as _$_unknown;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_unknown(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_unknown implements _unknown {
  const _$_unknown({this.message = ""});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NetworkFailure.unknown(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_unknown &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_unknownCopyWith<_$_unknown> get copyWith =>
      __$$_unknownCopyWithImpl<_$_unknown>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorCode, String message) server,
    required TResult Function() timeout,
    required TResult Function() unconnected,
    required TResult Function(String message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String errorCode, String message)? server,
    TResult Function()? timeout,
    TResult Function()? unconnected,
    TResult Function(String message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorCode, String message)? server,
    TResult Function()? timeout,
    TResult Function()? unconnected,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_server value) server,
    required TResult Function(_timeout value) timeout,
    required TResult Function(_unconnected value) unconnected,
    required TResult Function(_unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_server value)? server,
    TResult Function(_timeout value)? timeout,
    TResult Function(_unconnected value)? unconnected,
    TResult Function(_unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_server value)? server,
    TResult Function(_timeout value)? timeout,
    TResult Function(_unconnected value)? unconnected,
    TResult Function(_unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _unknown implements NetworkFailure {
  const factory _unknown({final String message}) = _$_unknown;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_unknownCopyWith<_$_unknown> get copyWith =>
      throw _privateConstructorUsedError;
}
