// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      defaultImageUrl: json['default_image_url'] as String?,
      pricePerGram: json['price_per_gram'] as String?,
      productPlu: json['product_plu'] as String?,
      productCode: json['product_code'] as String?,
      unit: json['unit'] as String?,
      price: json['price'] as String?,
      sku: json['sku'] as String?,
      productSellingPrice: json['product_selling_price'] as String?,
      productDiscountPrice: json['product_discount_price'] as String?,
      detailEndpoint: json['detail-endpoint'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'default_image_url': instance.defaultImageUrl,
      'price_per_gram': instance.pricePerGram,
      'product_plu': instance.productPlu,
      'product_code': instance.productCode,
      'unit': instance.unit,
      'price': instance.price,
      'sku': instance.sku,
      'product_selling_price': instance.productSellingPrice,
      'product_discount_price': instance.productDiscountPrice,
      'detail-endpoint': instance.detailEndpoint,
      'description': instance.description,
    };
