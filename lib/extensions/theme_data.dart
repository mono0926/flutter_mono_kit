import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ThemeDataEx on ThemeData {
  /// Create ThemeData which follows latest Material Design Spec.
  ThemeData followLatestSpec() {
    return copyWith(
        typography: Typography.material2018(),
        snackBarTheme: snackBarTheme.copyWith(
          behavior: SnackBarBehavior.floating,
        ),
        splashFactory: InkRipple.splashFactory,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: ZoomPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: ZoomPageTransitionsBuilder(),
          },
        ));
  }
}

ThemeData lightTheme() => ThemeData(
      colorSchemeSeed: Colors.green,
      useMaterial3: true,
    ).followLatestSpec();
ThemeData darkTheme() => ThemeData(
      colorSchemeSeed: Colors.green,
      useMaterial3: true,
      brightness: Brightness.dark,
    ).followLatestSpec().copyWith(
          cupertinoOverrideTheme: const CupertinoThemeData(
            // Needed for correct CupertinoTextField color (bug?)
            textTheme: CupertinoTextThemeData(),
          ),
        );
