import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    int? id,
    String? name,
    @JsonKey(name: "default_image_url") String? defaultImageUrl,
    @JsonKey(name: "price_per_gram") String? pricePerGram,
    @JsonKey(name: "product_plu") String? productPlu,
    @JsonKey(name: "product_code") String? productCode,
    String? unit,
    String? price,
    String? sku,
    @JsonKey(name: "product_selling_price") String? productSellingPrice,
    @JsonKey(name: "product_discount_price") String? productDiscountPrice,
    @JsonKey(name: "detail-endpoint") String? detailEndpoint,
    String? description,
  }) = _ProductModel;

  const ProductModel._();

  String get token => (detailEndpoint ?? "").split("/").last;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
