import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/utilities/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const App());
}
