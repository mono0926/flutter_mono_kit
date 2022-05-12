import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ThemeDataEx on ThemeData {
  ThemeData unifyToMobileApp() {
    return copyWith(
      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.padded,
    );
  }

  /// Create ThemeData which follows latest Material Design Spec.
  ThemeData followLatestSpec() {
    return copyWith(
      useMaterial3: true,
      snackBarTheme: snackBarTheme.copyWith(
        behavior: SnackBarBehavior.floating,
      ),
      splashFactory: InkSparkle.splashFactory,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}

ThemeData lightTheme() => ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
      ),
    ).followLatestSpec();
ThemeData darkTheme() => ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.dark,
      ),
    ).followLatestSpec().copyWith(
          cupertinoOverrideTheme: const CupertinoThemeData(
            // Needed for correct CupertinoTextField color (bug?)
            textTheme: CupertinoTextThemeData(),
          ),
        );
