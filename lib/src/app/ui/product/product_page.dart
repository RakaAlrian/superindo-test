import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        height: 60.sm,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: .5.sm,
            ),
          ],
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
          padding: EdgeInsets.only(
            top: 8.sm,
          ),
          height: 50.sm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
              ),
              Text(
                label,
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
          ShimmerContainer(
            width: double.maxFinite,
            height: 200.sm,
          ),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(16.sm),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ShimmerContainer(
                width: double.maxFinite,
                height: 26.sm,
              ),
              ShimmerContainer(
                margin: EdgeInsets.symmetric(vertical: 14.sm),
                width: double.maxFinite,
                height: 26.sm,
              ),
              ShimmerContainer(
                width: 70.sm,
                height: 22.sm,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(
                height: 10.sm,
              ),
              ShimmerContainer(
                width: double.maxFinite,
                height: 150.sm,
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
                  height: 200.sm,
                ),
              ),
              errorWidget: (context, url, error) {
                return const EmptyErrorImage();
              },
              width: double.maxFinite,
              height: 200.sm,
            ),
          Padding(
            padding: EdgeInsets.all(16.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product?.price == product?.productDiscountPrice)
                  Text(
                    product?.productSellingPrice.toInt.toRupiah ?? "",
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    softWrap: false,
                  ),
                Text(
                  product?.price.toInt.toRupiah ?? "",
                  style: TextStyle(
                    fontSize: 18.sm,
                    fontWeight: FontWeight.w600,
                    color: Palette.superindoBlue,
                  ),
                ),
                SizedBox(
                  height: 10.sm,
                ),
                Text(
                  product?.name ?? "",
                  style: TextStyle(
                    fontSize: 16.sm,
                    color: Colors.grey.shade900,
                  ),
                ),
                SizedBox(
                  height: 14.sm,
                ),
                Text(
                  context.string.product_variant + ":",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(
                  height: 10.sm,
                ),
                SizedBox(
                  height: 30.sm,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.sm,
                            color: Palette.superindoRed,
                          ),
                        ),
                        margin: EdgeInsets.only(right: 6.sm),
                        padding: EdgeInsets.all(6.sm),
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
                SizedBox(
                  height: 14.sm,
                ),
                Text(
                  context.string.product_description + ":",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(
                  height: 6.sm,
                ),
                Text(
                  product?.description ?? "",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(
                  height: 20.sm,
                ),
                Text(
                  context.string.similar_products,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16.sm,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.sm,
                ),
                _productsHorizontalList(),
                SizedBox(
                  height: 20.sm,
                ),
                Text(
                  context.string.recommendation_for_you,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16.sm,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.sm,
                ),
                _productsHorizontalList(),
                SizedBox(
                  height: 60.sm,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _productsHorizontalList() {
    return SizedBox(
      height: 260.sm,
      child: Consumer<ProductsNotifier>(
        builder: (context, value, child) {
          final state = value.productsState;
          if (state.isSuccess) {
            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.data!.length,
              itemBuilder: (context, index) {
                final product = state.data![index];
                return ProductGridItem(
                  product: product,
                  width: 150.sm,
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10.sm),
            );
          } else if (state.isFail) {
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
          } else {
            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return ProductLoadingItem(width: 150.sm);
              },
              separatorBuilder: (context, index) => SizedBox(width: 10.sm),
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
      toolbarHeight: kToolbarHeight.sm,
      backgroundColor: backgroundColor,
      elevation: 1,
      forceElevated: innerBoxIsScrolled,
      automaticallyImplyLeading: false,
      floating: true,
      leadingWidth: kToolbarHeight.sm,
      leading: InkResponse(
        onTap: () {
          context.router.pop();
        },
        radius: 20.sm,
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: fieldColor,
        ),
      ),
      titleSpacing: 0,
      title: TextField(
        style: TextStyle(
          color: fieldColor,
          height: 1.5.sm,
        ),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: context.string.search,
          hintStyle: const TextStyle(
            color: fieldColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.sm,
              color: fieldColor,
            ),
          ),
        ),
      ),
      actions: [
        SizedBox(
          width: kToolbarHeight.sm,
          child: InkResponse(
            onTap: () {},
            radius: 20.sm,
            child: const Icon(
              Icons.shopping_cart_rounded,
              color: fieldColor,
            ),
          ),
        ),
      ],
    );
  }
}
