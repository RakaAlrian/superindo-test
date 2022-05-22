import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:superindo/src/app/data/data_state.dart';
import 'package:superindo/src/app/data/failures/network_failure.dart';
import 'package:superindo/src/app/data/models/product_model.dart';
import 'package:superindo/src/app/data/repositories/product_repository.dart';

@injectable
class ProductsNotifier extends ChangeNotifier {
  final ProductRepository _productRepository;

  ProductsNotifier(this._productRepository);

  DataState<List<ProductModel>, NetworkFailure> _productsState = DataState.loading();
  DataState<List<ProductModel>, NetworkFailure> get productsState => _productsState;

  late int _pageKey;
  int get pageKey => _pageKey;

  Future loadProducts({int pageKey = 1}) async {
    _pageKey = pageKey;

    if (!_productsState.isLoading) {
      _productsState = DataState.loading();
      notifyListeners();
    }

    try {
      _productsState = await _loadSuccess();
    } on DioError catch (error) {
      _productsState = _loadFail(error);
    }

    notifyListeners();
  }

  Future<DataState<List<ProductModel>, NetworkFailure>> _loadSuccess() async {
    final products = await _productRepository.getProducts();
    return DataState.success(data: products);
  }

  DataState<List<ProductModel>, NetworkFailure> _loadFail(DioError error) {
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
