import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class TextScaleFactor extends StatelessWidget {
  const TextScaleFactor({
    Key key,
    @required this.child,
    this.min = 1,
    this.max,
  }) : super(key: key);

  final Widget child;
  final double min;
  final double max;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    if (mediaQuery == null) {
      assert(false, 'TextScaleFactor should be placed inside of MediaQuery');
      return child;
    }
    final textScaleFactor = mediaQuery.textScaleFactor ?? 1;
    final adjustedFactor =
        math.min(math.max(min ?? 0, textScaleFactor), max ?? double.infinity);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: adjustedFactor),
      child: child,
    );
  }
}
