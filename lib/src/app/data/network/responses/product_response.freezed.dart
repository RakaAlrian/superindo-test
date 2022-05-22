// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  return _ProductResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductResponse {
  bool get isSuccess => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  List<ProductModel>? get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductResponseCopyWith<ProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductResponseCopyWith<$Res> {
  factory $ProductResponseCopyWith(
          ProductResponse value, $Res Function(ProductResponse) then) =
      _$ProductResponseCopyWithImpl<$Res>;
  $Res call({bool isSuccess, int statusCode, List<ProductModel>? products});
}

/// @nodoc
class _$ProductResponseCopyWithImpl<$Res>
    implements $ProductResponseCopyWith<$Res> {
  _$ProductResponseCopyWithImpl(this._value, this._then);

  final ProductResponse _value;
  // ignore: unused_field
  final $Res Function(ProductResponse) _then;

  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? statusCode = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductResponseCopyWith<$Res>
    implements $ProductResponseCopyWith<$Res> {
  factory _$$_ProductResponseCopyWith(
          _$_ProductResponse value, $Res Function(_$_ProductResponse) then) =
      __$$_ProductResponseCopyWithImpl<$Res>;
  @override
  $Res call({bool isSuccess, int statusCode, List<ProductModel>? products});
}

/// @nodoc
class __$$_ProductResponseCopyWithImpl<$Res>
    extends _$ProductResponseCopyWithImpl<$Res>
    implements _$$_ProductResponseCopyWith<$Res> {
  __$$_ProductResponseCopyWithImpl(
      _$_ProductResponse _value, $Res Function(_$_ProductResponse) _then)
      : super(_value, (v) => _then(v as _$_ProductResponse));

  @override
  _$_ProductResponse get _value => super._value as _$_ProductResponse;

  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? statusCode = freezed,
    Object? products = freezed,
  }) {
    return _then(_$_ProductResponse(
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductResponse implements _ProductResponse {
  const _$_ProductResponse(
      {this.isSuccess = false,
      this.statusCode = 400,
      final List<ProductModel>? products})
      : _products = products;

  factory _$_ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ProductResponseFromJson(json);

  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final int statusCode;
  final List<ProductModel>? _products;
  @override
  List<ProductModel>? get products {
    final value = _products;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductResponse(isSuccess: $isSuccess, statusCode: $statusCode, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductResponse &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  _$$_ProductResponseCopyWith<_$_ProductResponse> get copyWith =>
      __$$_ProductResponseCopyWithImpl<_$_ProductResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductResponseToJson(this);
  }
}

abstract class _ProductResponse implements ProductResponse {
  const factory _ProductResponse(
      {final bool isSuccess,
      final int statusCode,
      final List<ProductModel>? products}) = _$_ProductResponse;

  factory _ProductResponse.fromJson(Map<String, dynamic> json) =
      _$_ProductResponse.fromJson;

  @override
  bool get isSuccess => throw _privateConstructorUsedError;
  @override
  int get statusCode => throw _privateConstructorUsedError;
  @override
  List<ProductModel>? get products => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductResponseCopyWith<_$_ProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
