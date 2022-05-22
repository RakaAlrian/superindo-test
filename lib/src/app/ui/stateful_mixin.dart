import 'package:flutter/widgets.dart';

mixin StatefulMixin<T extends StatefulWidget> on State<T> {
  bool _initialize = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialize) {
      _initialize = false;
      lateInitState();
    }
  }

  @protected
  void lateInitState() {}
}
