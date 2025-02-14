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
      snackBarTheme: snackBarTheme.copyWith(
        behavior: SnackBarBehavior.floating,
      ),
      splashFactory: InkSparkle.splashFactory,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      progressIndicatorTheme: progressIndicatorTheme.copyWith(year2023: false),
      sliderTheme: sliderTheme.copyWith(year2023: false),
    );
  }
}

ThemeData lightTheme() => ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
      ),
      useMaterial3: true,
    ).followLatestSpec();
ThemeData darkTheme() => ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    ).followLatestSpec().copyWith(
          cupertinoOverrideTheme: const CupertinoThemeData(
            // Needed for correct CupertinoTextField color (bug?)
            textTheme: CupertinoTextThemeData(),
          ),
        );
