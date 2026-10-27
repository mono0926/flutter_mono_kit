import 'dart:math' show max;

import 'package:flutter/widgets.dart';

typedef OverflowDetector = void Function(double overflowHeight);

class const OverflowDetectableText(
  final String data, {
  super.key,
  required final TextStyle style,
  required final OverflowDetector detector,
  final TextOverflow overflow = TextOverflow.clip,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(
          text: data,
          style: style,
        );

        final painter = TextPainter(
          maxLines: 100000000, // big enough
          textDirection: Directionality.of(context),
          text: span,
        )..layout(maxWidth: constraints.maxWidth);

        final overflowHeight = max(
          0.0, // ignore: prefer_int_literals
          painter.height - constraints.maxHeight,
        );
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => detector(overflowHeight),
        );
        return Text.rich(
          span,
          overflow: overflow,
        );
      },
    );
  }
}
