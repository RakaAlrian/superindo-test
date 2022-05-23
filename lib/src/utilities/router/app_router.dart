import 'package:auto_route/annotations.dart';
import 'package:superindo/src/app/ui/product/product_page.dart';
import 'package:superindo/src/app/ui/product/products_page.dart';
import 'package:superindo/src/app/ui/splash/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    AdaptiveRoute(
      page: SplashPage,
      initial: true,
    ),
    AdaptiveRoute(
      page: ProductsPage,
    ),
    AdaptiveRoute(
      page: ProductPage,
    ),
  ],
  preferRelativeImports: false,
)
class $AppRouter {}
