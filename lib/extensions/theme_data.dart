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
    bodyText1: englishLike.bodyText2,
    bodyText2: englishLike.bodyText1,
  );
}
