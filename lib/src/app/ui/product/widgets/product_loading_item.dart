import 'package:flutter/material.dart';

import '../../widgets/shimmer_loading.dart';


class ProductLoadingItem extends StatelessWidget {
  const ProductLoadingItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ShimmerLoading(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(6),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.maxFinite,
              height: 20,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 6),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.maxFinite,
              height: 10,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 6),
            ),
          ],
        ),
      ),
    );
  }
}
