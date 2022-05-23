// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:superindo/src/app/ui/product/product_page.dart' as _i3;
import 'package:superindo/src/app/ui/product/products_page.dart' as _i2;
import 'package:superindo/src/app/ui/splash/splash_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    ProductsPageRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.ProductsPage());
    },
    ProductPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProductPageRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.ProductPage(key: args.key, token: args.token));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashPageRoute.name, path: '/'),
        _i4.RouteConfig(ProductsPageRoute.name, path: '/products-page'),
        _i4.RouteConfig(ProductPageRoute.name, path: '/product-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i4.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.ProductsPage]
class ProductsPageRoute extends _i4.PageRouteInfo<void> {
  const ProductsPageRoute()
      : super(ProductsPageRoute.name, path: '/products-page');

  static const String name = 'ProductsPageRoute';
}

/// generated route for
/// [_i3.ProductPage]
class ProductPageRoute extends _i4.PageRouteInfo<ProductPageRouteArgs> {
  ProductPageRoute({_i5.Key? key, required String token})
      : super(ProductPageRoute.name,
            path: '/product-page',
            args: ProductPageRouteArgs(key: key, token: token));

  static const String name = 'ProductPageRoute';
}

class ProductPageRouteArgs {
  const ProductPageRouteArgs({this.key, required this.token});

  final _i5.Key? key;

  final String token;

  @override
  String toString() {
    return 'ProductPageRouteArgs{key: $key, token: $token}';
  }
}
