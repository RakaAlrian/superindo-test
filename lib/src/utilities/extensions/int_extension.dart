import 'package:flutter_multi_formatter/formatters/formatter_extension_methods.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';

extension IntExtension on int? {
  String get toRupiah {
    return (this ?? 0).toCurrencyString(
      leadingSymbol: "Rp ",
      mantissaLength: 0,
      thousandSeparator: ThousandSeparator.Period,
    );
  }
}
