import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:nested/nested.dart';

class TextScaleFactor extends SingleChildStatelessWidget {
  const TextScaleFactor({
    Key? key,
    Widget? child,
    this.min = 1,
    this.max,
  }) : super(
          key: key,
          child: child,
        );

  final double? min;
  final double? max;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    final mediaQuery = MediaQuery.maybeOf(context);
    if (mediaQuery == null) {
      assert(false, 'TextScaleFactor should be placed inside of MediaQuery');
      return child!;
    }
    final textScaleFactor = mediaQuery.textScaleFactor;
    final adjustedFactor =
        math.min(math.max(min ?? 0, textScaleFactor), max ?? double.infinity);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: adjustedFactor),
      child: child!,
    );
  }
}
