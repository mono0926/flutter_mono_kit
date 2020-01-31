import 'package:flutter/material.dart';

extension ThemeDataEx on ThemeData {
  ThemeData appliedCommon() {
    return copyWith(
      typography: Typography.material2018(),
      snackBarTheme: snackBarTheme.copyWith(
        behavior: SnackBarBehavior.floating,
      ),
      splashFactory: InkRipple.splashFactory,
    );
  }
}
