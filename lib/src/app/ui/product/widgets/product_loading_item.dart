import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          width: 1.sm,
          color: Colors.grey.shade200,
        ),
      ),
      child: ShimmerLoading(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerContainer(
              width: width,
              height: 150.sm,
            ),
            SizedBox(
              height: 10.sm,
            ),
            ShimmerContainer(
              width: width,
              height: 20.sm,
              margin: EdgeInsets.symmetric(horizontal: 6.sm),
            ),
            SizedBox(
              height: 10.sm,
            ),
            ShimmerContainer(
              width: width,
              height: 10.sm,
              margin: EdgeInsets.symmetric(horizontal: 6.sm),
            ),
          ],
        ),
      ),
    );
  }
}
