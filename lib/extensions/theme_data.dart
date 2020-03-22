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
    );
  }
}

ThemeData lightTheme() => ThemeData.from(
      colorScheme: const ColorScheme.light(),
    ).followLatestSpec();
ThemeData darkTheme() => ThemeData.from(
      colorScheme: const ColorScheme.dark(),
    ).followLatestSpec().copyWith(
  cupertinoOverrideTheme: const CupertinoThemeData(
    // Needed for correct CupertinoTextField color (bug?)
    textTheme: CupertinoTextThemeData(),
  ),
);
