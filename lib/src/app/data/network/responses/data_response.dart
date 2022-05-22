import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_response.freezed.dart';
part 'data_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
@freezed
class DataResponse<T> with _$DataResponse<T> {
  const factory DataResponse({
    @Default(false) bool isSuccess,
    @Default(400) int statusCode,
    T? data,
  }) = _DataResponse<T>;

  const DataResponse._();

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$DataResponseFromJson<T>(json, fromJsonT);
  }

  Map<String, dynamic> toJson(
    Map<String, dynamic> Function(T? value) toJsonT,
  ) {
    return _$DataResponseToJson<T>(this, toJsonT);
  }
}
