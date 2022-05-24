import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:superindo/src/app/data/data_state.dart';
import 'package:superindo/src/app/data/failures/network_failure.dart';
import 'package:superindo/src/app/data/models/product_model.dart';
import 'package:superindo/src/app/notifiers/products_notifier.dart';
import 'package:superindo/src/app/ui/palette.dart';
import 'package:superindo/src/app/ui/stateful_mixin.dart';
import 'package:superindo/src/utilities/extensions/context_extension.dart';

import '../../../utilities/injector/injector.dart';
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
  }

  @override
  void dispose() {
    super.dispose();
    _productsNotifier.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _pagingController.refresh();
        },
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              _searchAppBar(innerBoxIsScrolled),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => _pagingController.refresh(),
                  child: Consumer<ProductsNotifier>(
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
                ),
              ),
            ],
          ),
        ),
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
