import 'package:flutter/material.dart';
import 'product_loading_item.dart';

class ProductLoading extends StatelessWidget {
  const ProductLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.8,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const ProductLoadingItem();
        },
        childCount: 4,
      ),
    );
  }
}
