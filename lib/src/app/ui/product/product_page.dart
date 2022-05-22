import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superindo/src/app/notifiers/product_notifier.dart';
import 'package:superindo/src/app/ui/stateful_mixin.dart';
import 'package:superindo/src/utilities/extensions/string_extension.dart';
import 'package:superindo/src/utilities/injector.dart';

class ProductPage extends StatelessWidget {
  final String token;

  const ProductPage({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => inject<ProductNotifier>(),
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

  @override
  void lateInitState() {
    super.lateInitState();
    _productNotifier.loadProduct(token: widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.string.appTitle),
      ),
      body: Consumer<ProductNotifier>(
        builder: (context, value, child) {
          final state = value.productState;
          if (state.isSuccess) {
            final product = state.data;
            return ListView(
              children: [
                Text(product?.name ?? ""),
                const Spacer(
                  flex: 2,
                ),
                Text(product?.description ?? ""),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
