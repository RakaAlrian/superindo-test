import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superindo/src/app/data/models/product_model.dart';
import 'package:superindo/src/app/ui/widgets/shimmer_loading.dart';
import 'package:superindo/src/utilities/extensions/int_extension.dart';
import 'package:superindo/src/utilities/extensions/string_extension.dart';

import '../../../../utilities/router/app_router.gr.dart';
import '../../palette.dart';
import '../../widgets/empty_error_image.dart';

class ProductGridItem extends StatelessWidget {
  final ProductModel? product;
  final double width;

  const ProductGridItem({
    Key? key,
    required this.product,
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
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product?.defaultImageUrl == null)
                const EmptyErrorImage()
              else
                CachedNetworkImage(
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                  imageUrl: product?.defaultImageUrl ?? "",
                  placeholder: (context, url) => ShimmerLoading(
                    child: ShimmerContainer(
                      width: double.maxFinite,
                      height: 150.sm,
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return const EmptyErrorImage();
                  },
                  width: double.maxFinite,
                  height: 150.sm,
                ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(6.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product?.name ?? "",
                        style: TextStyle(fontSize: 12.sm),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      SizedBox(
                        height: 5.sm,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            width: 1.sm,
                            color: Palette.superindoRed,
                          ),
                        ),
                        padding: EdgeInsets.all(3.sm),
                        child: Text(
                          product?.unit ?? "-",
                          style: TextStyle(
                            fontSize: 10.sm,
                            color: Palette.superindoRed,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.sm,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (product?.price == product?.productDiscountPrice)
                              Text(
                                product?.productSellingPrice.toInt.toRupiah ?? "",
                                style: TextStyle(
                                  fontSize: 12.sm,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                softWrap: false,
                              ),
                            Text(
                              product?.price.toInt.toRupiah ?? "",
                              style: TextStyle(
                                fontSize: 16.sm,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  context.router.push(ProductPageRoute(token: product?.token ?? ""));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
