// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductResponse _$$_ProductResponseFromJson(Map<String, dynamic> json) =>
    _$_ProductResponse(
      isSuccess: json['isSuccess'] as bool? ?? false,
      statusCode: json['statusCode'] as int? ?? 400,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProductResponseToJson(_$_ProductResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'statusCode': instance.statusCode,
      'products': instance.products,
    };
