import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_state.freezed.dart';

enum DataStatus {
  success,
  loading,
  fail,
}

@freezed
class DataState<D, F> with _$DataState<D, F> {
  const factory DataState({
    DataStatus? dataStatus,
    D? data,
    F? failure,
  }) = _DataState<D, F>;

  const DataState._();

  bool get isSuccess => dataStatus == DataStatus.success;

  bool get isLoading => dataStatus == DataStatus.loading;

  bool get isFail => dataStatus == DataStatus.fail;

  factory DataState.success({
    D? data,
  }) =>
      DataState(
        dataStatus: DataStatus.success,
        data: data,
      );

  factory DataState.loading({
    D? data,
  }) =>
      DataState(
        dataStatus: DataStatus.loading,
        data: data,
      );

  factory DataState.fail({
    D? data,
    required F failure,
  }) =>
      DataState(
        dataStatus: DataStatus.fail,
        data: data,
        failure: failure,
      );
}
