import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:superindo/src/utilities/extensions/string_extension.dart';
import 'package:superindo/src/utilities/app_router.dart';

import 'utilities/app_router.gr.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final id = 1;

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      restorationScopeId: "superindo-app",
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
      ],
      onGenerateTitle: (BuildContext context) => context.string.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      builder: (context, child) => child!,
    );
  }
}
