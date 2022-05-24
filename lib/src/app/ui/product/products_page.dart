import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:superindo/src/app/data/data_state.dart';
import 'package:superindo/src/app/data/failures/network_failure.dart';
import 'package:superindo/src/app/data/models/product_model.dart';
import 'package:superindo/src/app/notifiers/products_notifier.dart';
import 'package:superindo/src/app/ui/palette.dart';
import 'package:superindo/src/app/ui/stateful_mixin.dart';
import 'package:superindo/src/utilities/extensions/context_extension.dart';

import '../../../utilities/injector/injector.dart';
import '../widgets/empty_error_image.dart';
import '../widgets/shimmer_loading.dart';
import 'widgets/product_grid.dart';
import 'widgets/product_loading.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => inject<ProductsNotifier>(),
      child: const _ProductsContent(),
    );
  }
}

class _ProductsContent extends StatefulWidget {
  const _ProductsContent({Key? key}) : super(key: key);

  @override
  State<_ProductsContent> createState() => _ProductsContentState();
}

class _ProductsContentState extends State<_ProductsContent> with StatefulMixin {
  ProductsNotifier get _productsNotifier => context.read<ProductsNotifier>();

  final PagingController<int, ProductModel> _pagingController = PagingController(
    firstPageKey: 1,
  );

  int _bannerIndex = 0;
  final _bannerController = PageController(initialPage: 0);
  late Timer _timer;

  @override
  void lateInitState() {
    super.lateInitState();
    _productsNotifier.loadProducts();

    _pagingController.addPageRequestListener((pageKey) {
      _productsNotifier.loadProducts(pageKey: pageKey);
    });

    _productsNotifier.addListener(() {
      final state = _productsNotifier.productsState;

      if (state.isFail && _productsNotifier.pageKey == 1) {
        _pagingController.error = _failureWidget(state);
      }

      if (state.isSuccess) {
        final List<ProductModel> newItems = state.data!;
        final isLastPage = newItems.length < 5;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = _productsNotifier.pageKey + 1;
          _pagingController.appendPage(newItems, nextPageKey);
        }
      }
    });

    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        if (_bannerIndex < 2) {
          _bannerIndex++;
        } else {
          _bannerIndex = 0;
        }

        _bannerController.animateToPage(
          _bannerIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _productsNotifier.dispose();
    _pagingController.dispose();
    _bannerController.dispose();
    _timer.cancel();
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
        body: RefreshIndicator(
          onRefresh: () async => _pagingController.refresh(),
          child: CustomScrollView(
            slivers: [
              _banner(),
              Consumer<ProductsNotifier>(
                builder: (context, value, child) {
                  final state = value.productsState;

                  if (state.isLoading && value.pageKey == 1) {
                    return const ProductLoading();
                  } else {
                    return ProductGrid(
                      pagingController: _pagingController,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: kBottomNavigationBarHeight.sm,
        child: BottomNavigationBar(
          currentIndex: 0,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.store_rounded,
              ),
              label: context.string.nav_shopping,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.receipt_long_rounded,
              ),
              label: context.string.nav_transaction,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.confirmation_num_rounded,
              ),
              label: context.string.nav_voucher,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.account_circle_rounded,
              ),
              label: context.string.nav_profile,
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _banner() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 230.sm,
            child: PageView(
              controller: _bannerController,
              children: [
                _bannerImage(
                  imageUrl: "https://i.ytimg.com/vi/44NJUzb007A/maxresdefault.jpg",
                ),
                _bannerImage(
                  imageUrl: "https://i0.wp.com/hargabelanja.com/wp-content/uploads/Promo-SuperIndo-Dapur-Impian-14-Oktober-2021-5-Januari-2022-Terbaru.jpg",
                ),
                _bannerImage(
                  imageUrl: "https://i0.wp.com/hargabelanja.com/wp-content/uploads/Promo-Super-Indo-Katalog-Super-Hemat-Terbaru-14-20-Oktober-2021-Minggu-Ini.jpg",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6.sm,
          ),
          SmoothPageIndicator(
            controller: _bannerController,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Palette.superindoRed,
              dotColor: Colors.grey.shade400,
              dotHeight: 6.sm,
              dotWidth: 6.sm,
            ),
          )
        ],
      ),
    );
  }

  CachedNetworkImage _bannerImage({
    required String imageUrl,
  }) {
    return CachedNetworkImage(
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
      imageUrl: imageUrl,
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
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.only(left: 16.sm),
        child: TextField(
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
        )
      ],
    );
  }

  Widget _failureWidget(DataState<List<ProductModel>, NetworkFailure> state) {
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
}
