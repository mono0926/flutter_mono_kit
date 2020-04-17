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
      // Follow V2 Spec: https://github.com/flutter/flutter/blob/b00b4e83424a118af66407d5e5c3e3a1fda83386/packages/flutter/lib/src/material/slider.dart#L628-L633
      sliderTheme: const SliderThemeData(
        trackHeight: 4,
        trackShape: RoundedRectSliderTrackShape(useV2Slider: true),
        tickMarkShape: RoundSliderTickMarkShape(useV2Slider: true),
        thumbShape: RoundSliderThumbShape(useV2Slider: true),
        valueIndicatorShape: RectangularSliderValueIndicatorShape(),
      ),
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
