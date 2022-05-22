import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/product_model.dart';
import '../responses/data_response.dart';

part 'product_service.g.dart';

@injectable
@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class ProductService {
  @factoryMethod
  factory ProductService(Dio dio) = _ProductService;

  @GET("{token}")
  Future<DataResponse<ProductModel>> getProduct({
    @Path() required String token,
  });
}
