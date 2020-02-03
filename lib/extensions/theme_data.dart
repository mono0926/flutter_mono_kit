import 'package:flutter/material.dart';

extension ThemeDataEx on ThemeData {
  /// Create ThemeData which follows latest Material Design Spec.
  ThemeData followLatestSpec() {
    return copyWith(
      typography: Typography.material2018().copyWith(
        englishLike: material2018EnglishLikeFixed(),
      ),
      snackBarTheme: snackBarTheme.copyWith(
        behavior: SnackBarBehavior.floating,
      ),
      splashFactory: InkRipple.splashFactory,
    );
  }
}

// Workaround: https://github.com/flutter/flutter/pull/49756
TextTheme material2018EnglishLikeFixed() {
  final englishLike = Typography.material2018().englishLike;
  return englishLike.copyWith(
    bodyText1: TextStyle(
      debugLabel: 'englishLike bodyText1 2018 (fixed by mono_kit)',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.5,
    ),
    bodyText2: TextStyle(
      debugLabel: 'englishLike bodyText2 2018 (fixed by mono_kit)',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.25,
    ),
  );
}
