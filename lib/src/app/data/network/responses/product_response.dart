import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/product_model.dart';

part 'product_response.freezed.dart';
part 'product_response.g.dart';

@freezed
class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    @Default(false) bool isSuccess,
    @Default(400) int statusCode,
    List<ProductModel>? products,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);
}