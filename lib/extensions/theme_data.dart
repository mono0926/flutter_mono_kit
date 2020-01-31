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
