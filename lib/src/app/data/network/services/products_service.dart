import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../responses/product_response.dart';

part 'products_service.g.dart';

@injectable
@RestApi()
abstract class ProductsService {
  @factoryMethod
  factory ProductsService(Dio dio) = _ProductsService;

  static const _defaultPath = "/products";

  @GET(_defaultPath)
  Future<ProductResponse> getProducts();
}
