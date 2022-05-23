import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
                          top: Radius.circular(4),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                  imageUrl: product?.defaultImageUrl ?? "",
                  placeholder: (context, url) => const ShimmerLoading(
                    child: ShimmerContainer(
                      width: double.maxFinite,
                      height: 150,
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return const EmptyErrorImage();
                  },
                  width: double.maxFinite,
                  height: 150,
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product?.name ?? "",
                        style: const TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Palette.superindoRed,
                          ),
                        ),
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          product?.unit ?? "-",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Palette.superindoRed,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (product?.price == product?.productDiscountPrice)
                              Text(
                                product?.productSellingPrice.toInt.toRupiah ?? "",
                                style: const TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                softWrap: false,
                              ),
                            Text(
                              product?.price.toInt.toRupiah ?? "",
                              style: const TextStyle(
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
