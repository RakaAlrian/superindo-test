// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../app/ui/product/product_page.dart' as _i2;
import '../app/ui/product/products_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ProductsPageRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.ProductsPage());
    },
    ProductPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProductPageRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.ProductPage(key: args.key, token: args.token));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(ProductsPageRoute.name, path: '/'),
        _i3.RouteConfig(ProductPageRoute.name, path: '/product-page')
      ];
}

/// generated route for
/// [_i1.ProductsPage]
class ProductsPageRoute extends _i3.PageRouteInfo<void> {
  const ProductsPageRoute() : super(ProductsPageRoute.name, path: '/');

  static const String name = 'ProductsPageRoute';
}

/// generated route for
/// [_i2.ProductPage]
class ProductPageRoute extends _i3.PageRouteInfo<ProductPageRouteArgs> {
  ProductPageRoute({_i4.Key? key, required String token})
      : super(ProductPageRoute.name,
            path: '/product-page',
            args: ProductPageRouteArgs(key: key, token: token));

  static const String name = 'ProductPageRoute';
}

class ProductPageRouteArgs {
  const ProductPageRouteArgs({this.key, required this.token});

  final _i4.Key? key;

  final String token;

  @override
  String toString() {
    return 'ProductPageRouteArgs{key: $key, token: $token}';
  }
}
