import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:superindo/src/app/data/data_state.dart';
import 'package:superindo/src/app/data/failures/network_failure.dart';
import 'package:superindo/src/app/data/models/product_model.dart';
import 'package:superindo/src/app/data/repositories/product_repository.dart';

@injectable
class ProductNotifier extends ChangeNotifier {
  final ProductRepository _productRepository;

  ProductNotifier(this._productRepository);

  DataState<ProductModel, NetworkFailure> _productState = DataState.loading();
  DataState<ProductModel, NetworkFailure> get productState => _productState;

  Future loadProduct({String token = ""}) async {
    if (!_productState.isLoading) {
      _productState = DataState.loading();
      notifyListeners();
    }

    try {
      _productState = await _loadSuccess(token: token);
    } on DioError catch (error) {
      _productState = _loadFail(error);
    }

    notifyListeners();
  }

  Future<DataState<ProductModel, NetworkFailure>> _loadSuccess({required String token}) async {
    final product = await _productRepository.getProduct(token: token);
    return DataState.success(data: product);
  }

  DataState<ProductModel, NetworkFailure> _loadFail(DioError error) {
    switch (error.type) {
      case DioErrorType.response:
        return DataState.fail(failure: const NetworkFailure.server());
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return DataState.fail(failure: const NetworkFailure.timeout());
      case DioErrorType.other:
        return DataState.fail(failure: const NetworkFailure.unconnected());
      default:
        return DataState.fail(failure: const NetworkFailure.unknown());
    }
  }
}
