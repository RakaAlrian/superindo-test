import 'package:auto_route/annotations.dart';
import 'package:superindo/src/app/ui/product/product_page.dart';
import 'package:superindo/src/app/ui/product/products_page.dart';

@MaterialAutoRouter(routes: [
  AdaptiveRoute(
    page: ProductsPage,
    initial: true,
  ),
  AdaptiveRoute(
    page: ProductPage,
  ),
])
class $AppRouter {}
