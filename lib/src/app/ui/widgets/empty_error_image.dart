import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilities/constants.dart';

class EmptyErrorImage extends StatelessWidget {
  const EmptyErrorImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sm),
      width: double.infinity,
      height: 150.sm,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(4),
        ),
      ),
      child: Center(
        child: Image.asset(
          "${ConstAsset.images}logo_superindo.png",
          height: 60.sm,
        ),
      ),
    );
  }
}