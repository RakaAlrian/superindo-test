import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:superindo/src/app/data/models/product_model.dart';
import 'package:superindo/src/app/ui/widgets/shimmer_loading.dart';
import 'package:superindo/src/utilities/app_router.gr.dart';
import 'package:superindo/src/utilities/constants.dart';

class ProductGridItem extends StatelessWidget {
  final ProductModel? product;

  const ProductGridItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product?.defaultImageUrl == null)
                _emptyOrErrorImage()
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
                    return _emptyOrErrorImage();
                  },
                  width: double.maxFinite,
                  height: 150,
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Flex(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    direction: Axis.vertical,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          product?.name ?? "",
                          style: const TextStyle(fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (product?.price == product?.productDiscountPrice)
                              Text(
                                product?.productSellingPrice ?? "",
                                style: const TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                ),
                                maxLines: 1,
                                softWrap: false,
                              ),
                            Text(
                              product?.price ?? "",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                              maxLines: 1,
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
                borderRadius: BorderRadius.circular(4),
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

  Container _emptyOrErrorImage() {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(4),
        ),
      ),
      child: Center(
        child: Image.asset(
          "${ConstAsset.images}logo_superindo.png",
          height: 60,
        ),
      ),
    );
  }
}
