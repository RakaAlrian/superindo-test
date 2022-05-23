import 'package:flutter/material.dart';

import '../../widgets/shimmer_loading.dart';

class ProductLoadingItem extends StatelessWidget {
  final double width;

  const ProductLoadingItem({
    Key? key,
    this.width = double.maxFinite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: ShimmerLoading(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerContainer(
              width: width,
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            ShimmerContainer(
              width: width,
              height: 20,
              margin: const EdgeInsets.symmetric(horizontal: 6),
            ),
            const SizedBox(
              height: 10,
            ),
            ShimmerContainer(
              width: width,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 6),
            ),
          ],
        ),
      ),
    );
  }
}
