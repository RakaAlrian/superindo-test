import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'product_loading_item.dart';

class ProductLoading extends StatelessWidget {
  const ProductLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(16.sm),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, child) {
            return const ProductLoadingItem();
          },
          childCount: 4,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 10.w,
          mainAxisExtent: 260.sm,
        ),
      ),
    );
  }
}
