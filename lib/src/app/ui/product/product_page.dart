import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superindo/src/app/data/data_state.dart';
import 'package:superindo/src/app/data/failures/network_failure.dart';
import 'package:superindo/src/app/data/models/product_model.dart';
import 'package:superindo/src/app/notifiers/product_notifier.dart';
import 'package:superindo/src/app/ui/palette.dart';
import 'package:superindo/src/app/ui/product/widgets/product_grid_item.dart';
import 'package:superindo/src/app/ui/product/widgets/product_loading_item.dart';
import 'package:superindo/src/app/ui/stateful_mixin.dart';
import 'package:superindo/src/utilities/extensions/context_extension.dart';
import 'package:superindo/src/utilities/extensions/int_extension.dart';
import 'package:superindo/src/utilities/extensions/string_extension.dart';

import '../../../utilities/injector/injector.dart';
import '../../notifiers/products_notifier.dart';
import '../widgets/empty_error_image.dart';
import '../widgets/shimmer_loading.dart';

class ProductPage extends StatelessWidget {
  final String token;

  const ProductPage({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => inject<ProductNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (context) => inject<ProductsNotifier>(),
        )
      ],
      child: _ProductContent(token: token),
    );
  }
}

class _ProductContent extends StatefulWidget {
  final String token;

  const _ProductContent({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  State<_ProductContent> createState() => _ProductContentState();
}

class _ProductContentState extends State<_ProductContent> with StatefulMixin {
  ProductNotifier get _productNotifier => context.read<ProductNotifier>();
  ProductsNotifier get _productsNotifier => context.read<ProductsNotifier>();

  @override
  void lateInitState() {
    super.lateInitState();
    _productNotifier.loadProduct(token: widget.token);
  }

  @override
  void dispose() {
    super.dispose();
    _productNotifier.dispose();
    _productsNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            _searchAppBar(innerBoxIsScrolled),
          ];
        },
        body: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () => _productNotifier.loadProduct(token: widget.token),
              child: Consumer<ProductNotifier>(
                builder: (context, value, child) {
                  final state = value.productState;
                  if (state.isSuccess) {
                    _productsNotifier.loadProducts();
                    final product = state.data;
                    return _loadSuccess(product);
                  } else if (state.isFail) {
                    return _loadFail(state);
                  } else {
                    return _loading();
                  }
                },
              ),
            ),
            _bottomMenu(),
          ],
        ),
      ),
    );
  }

  Center _loadFail(DataState<ProductModel, NetworkFailure> state) {
    return Center(
      child: state.failure!.when(
        server: (errorCode, message) {
          return const Text("Server Error");
        },
        timeout: () {
          return const Text("Server Time Out");
        },
        unconnected: () {
          return const Text("Server Unconnected");
        },
        unknown: (message) {
          return const Text("Unknown Failure");
        },
      ),
    );
  }

  Align _bottomMenu() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.maxFinite,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade600,
              width: .5,
            ),
          ),
        ),
        child: Material(
          child: Row(
            children: [
              _button(
                icon: Icons.favorite_outline_rounded,
                label: "Suka",
              ),
              _button(
                icon: Icons.shopping_cart_checkout_rounded,
                label: "Masukkan Keranjang",
              ),
              _button(
                icon: Icons.share,
                label: "Bagikan",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button({
    required IconData icon,
    required String label,
  }) {
    return Expanded(
      child: InkResponse(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.grey.shade600,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ShimmerLoading _loading() {
    return ShimmerLoading(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          const ShimmerContainer(
            width: double.maxFinite,
            height: 200,
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              ShimmerContainer(
                width: double.maxFinite,
                height: 26,
              ),
              ShimmerContainer(
                margin: EdgeInsets.symmetric(vertical: 14),
                width: double.maxFinite,
                height: 26,
              ),
              ShimmerContainer(
                width: 70,
                height: 22,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(
                height: 10,
              ),
              ShimmerContainer(
                width: double.maxFinite,
                height: 150,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _loadSuccess(ProductModel? product) {
    return SingleChildScrollView(
      child: Column(
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
                  height: 200,
                ),
              ),
              errorWidget: (context, url, error) {
                return const EmptyErrorImage();
              },
              width: double.maxFinite,
              height: 200,
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.name ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (product?.price == product?.productDiscountPrice)
                  Text(
                    product?.productSellingPrice.toInt.toRupiah ?? "",
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red,
                    ),
                    maxLines: 1,
                    softWrap: false,
                  ),
                Text(
                  product?.price.toInt.toRupiah ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Palette.superindoBlue,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  context.string.product_variant + " :",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Palette.superindoRed,
                          ),
                        ),
                        margin: const EdgeInsets.only(right: 6),
                        padding: const EdgeInsets.all(6),
                        alignment: Alignment.center,
                        child: Text(
                          product?.unit ?? "-",
                          style: const TextStyle(
                            color: Palette.superindoRed,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  context.string.product_description + " :",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  product?.description ?? "",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  context.string.you_might_like,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _recommendationList(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  context.string.you_just_saw,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _recentList(),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _recommendationList() {
    return SizedBox(
      height: 255,
      child: Consumer<ProductsNotifier>(
        builder: (context, value, child) {
          final state = value.productsState;
          if (state.isLoading) {
            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return const ProductLoadingItem(width: 180);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            );
          } else if (state.isSuccess) {
            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.data!.length,
              itemBuilder: (context, index) {
                final product = state.data![index];
                return ProductGridItem(
                  product: product,
                  width: 180,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            );
          } else {
            return Center(
              child: state.failure?.when(
                server: (errorCode, message) {
                  return const Text("Server Error");
                },
                timeout: () {
                  return const Text("Server Time Out");
                },
                unconnected: () {
                  return const Text("Server Unconnected");
                },
                unknown: (message) {
                  return const Text("Unknown Failure");
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _recentList() {
    return SizedBox(
      height: 255,
      child: Consumer<ProductsNotifier>(
        builder: (context, value, child) {
          final state = value.productsState;
          if (state.isLoading) {
            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return const ProductLoadingItem(width: 180);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            );
          } else if (state.isSuccess) {
            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.data!.length,
              itemBuilder: (context, index) {
                final product = state.data![index];
                return ProductGridItem(
                  product: product,
                  width: 180,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            );
          } else {
            return Center(
              child: state.failure?.when(
                server: (errorCode, message) {
                  return const Text("Server Error");
                },
                timeout: () {
                  return const Text("Server Time Out");
                },
                unconnected: () {
                  return const Text("Server Unconnected");
                },
                unknown: (message) {
                  return const Text("Unknown Failure");
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _searchAppBar(bool innerBoxIsScrolled) {
    const backgroundColor = Colors.white;
    const fieldColor = Palette.superindoRed;
    return SliverAppBar(
      backgroundColor: backgroundColor,
      elevation: 1,
      forceElevated: innerBoxIsScrolled,
      automaticallyImplyLeading: false,
      floating: true,
      leadingWidth: 36,
      leading: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: InkResponse(
          onTap: () {
            context.router.pop();
          },
          radius: 20,
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: fieldColor,
          ),
        ),
      ),
      title: TextField(
        style: const TextStyle(
          color: fieldColor,
          height: 1.5,
        ),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: context.string.search,
          hintStyle: const TextStyle(
            color: fieldColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: fieldColor,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: InkResponse(
            onTap: () {},
            radius: 20,
            child: const Icon(
              Icons.shopping_cart_rounded,
              color: fieldColor,
            ),
          ),
        )
      ],
    );
  }
}
