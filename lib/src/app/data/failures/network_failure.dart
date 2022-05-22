import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_failure.freezed.dart';

@freezed
class NetworkFailure with _$NetworkFailure {
  const factory NetworkFailure.server({
    @Default("") String errorCode,
    @Default("") String message,
  }) = _server;

  const factory NetworkFailure.timeout() = _timeout;

  const factory NetworkFailure.unconnected() = _unconnected;

  const factory NetworkFailure.unknown({
    @Default("") String message,
  }) = _unknown;
}
