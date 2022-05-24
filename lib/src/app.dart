import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superindo/src/utilities/extensions/context_extension.dart';

import 'app/ui/palette.dart';
import 'utilities/router/app_router.gr.dart';

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
    return ScreenUtilInit(
      designSize: const Size(393, 380),
      builder: (context, child) {
        return MaterialApp.router(
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("en"),
            Locale("id"),
          ],
          onGenerateTitle: (BuildContext context) => context.string.app_title,
          theme: ThemeData(
            primaryColor: Palette.superindoRed,
            colorScheme: const ColorScheme.light(
              primary: Palette.superindoRed,
              secondary: Palette.superindoBlue,
            ),
            toggleableActiveColor: Palette.superindoRed,
            scaffoldBackgroundColor: Colors.white,
            canvasColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.aBeeZeeTextTheme().copyWith(
              bodyText2: TextStyle(
                fontSize: 14.sm,
                color: Colors.grey.shade800,
              ),
              button: TextStyle(
                fontSize: 14.sm,
                color: Colors.grey.shade800,
              ),
            ),
            iconTheme: IconThemeData(
              size: 24.sm,
              color: Colors.grey.shade800,
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.grey.shade400,
              selectionColor: Colors.grey.shade400,
              selectionHandleColor: Colors.grey.shade400,
            ),
            inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 8.sm,
                horizontal: 12.sm,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.sm,
                  color: Colors.grey.shade400,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.sm,
                  color: Colors.grey,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.sm,
                  color: Colors.grey.shade200,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.sm,
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.sm,
                  color: Colors.red.shade400,
                ),
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedIconTheme: IconThemeData(
                size: 24.sm,
              ),
              unselectedIconTheme: IconThemeData(
                size: 24.sm,
              ),
              selectedLabelStyle: TextStyle(
                fontSize: 14.sm,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.sm,
              ),
              selectedItemColor: Palette.superindoRed,
              unselectedItemColor: Colors.grey,
            ),
          ),
          builder: (context, child) => child!,
        );
      },
    );
  }
}
