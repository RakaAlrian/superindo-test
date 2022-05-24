import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:superindo/src/app/data/models/product_model.dart';

import 'product_grid_item.dart';
import 'product_loading_item.dart';

class ProductGrid extends StatelessWidget {
  final PagingController<int, ProductModel>? pagingController;

  const ProductGrid({
    Key? key,
    this.pagingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(16.sm),
      sliver: PagedSliverGrid(
        pagingController: pagingController!,
        builderDelegate: _getPagedChildBuilderDelegate(),
        gridDelegate: _getSliverGridDelegateWithFixedCrossAxisCount(),
      ),
    );
  }

  _getSliverGridDelegateWithFixedCrossAxisCount() {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10.sm,
      crossAxisSpacing: 10.sm,
      mainAxisExtent: 260.sm,
    );
  }

  PagedChildBuilderDelegate<ProductModel> _getPagedChildBuilderDelegate() {
    return PagedChildBuilderDelegate<ProductModel>(
      itemBuilder: (context, product, index) {
        return ProductGridItem(product: product);
      },
      newPageProgressIndicatorBuilder: (context) {
        return const ProductLoadingItem();
      },
      firstPageProgressIndicatorBuilder: (context) => const Material(),
      firstPageErrorIndicatorBuilder: (context) {
        return pagingController?.error as Widget;
      },
      newPageErrorIndicatorBuilder: (context) {
        return pagingController?.error as Widget;
      },
      noItemsFoundIndicatorBuilder: (context) {
        return const Center(
          child: Text("Product Empty"),
        );
      },
    );
  }
}
