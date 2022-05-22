import 'package:injectable/injectable.dart';
import 'package:superindo/src/app/data/models/product_model.dart';

import '../network/services/products_service.dart';
import '../network/services/product_service.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProduct({
    required String token,
  });
}

@Injectable(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  final ProductsService productsService;
  final ProductService productService;

  ProductRepositoryImpl(
    this.productsService,
    this.productService,
  );

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await productsService.getProducts();
    return response.products ?? [];
  }

  @override
  Future<ProductModel> getProduct({
    required String token,
  }) async {
    final response = await productService.getProduct(
      token: token,
    );
    return response.data ?? const ProductModel();
  }
}
