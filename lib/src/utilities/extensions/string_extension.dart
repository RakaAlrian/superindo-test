import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../injector.dart' as injector;

extension ContextExtension on BuildContext {
  T inject<T extends Object>({Object? param}) => injector.inject<T>(param1: this, param2: param);

  AppLocalizations get string => AppLocalizations.of(this)!;
}
