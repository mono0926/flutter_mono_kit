import 'package:flutter/material.dart';
import 'package:tinycolor2/tinycolor2.dart';

extension ColorEx on Color {
  MaterialColor get materialColor {
    final tiny = TinyColor.fromColor(this);
    return MaterialColor(
      value,
      Map.fromIterables(
        [50, 100, 200, 300, 400, 500, 600, 700, 800, 900],
        List.generate(10, (i) => (i * 100 - 500) ~/ 15)
            .map((v) => tiny.darken(v).color),
      ),
    );
  }
}
