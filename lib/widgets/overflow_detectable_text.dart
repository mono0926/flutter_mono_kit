import 'dart:math' show max;

import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

typedef OverflowDetector = void Function(double overflowHeight);

class OverflowDetectableText extends StatelessWidget {
  const OverflowDetectableText(
    this.data, {
    Key? key,
    required this.style,
    required this.detector,
    this.overflow = TextOverflow.clip,
  }) : super(key: key);

  final String data;
  final TextStyle style;
  final TextOverflow overflow;
  final OverflowDetector detector;

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
        SchedulerBinding.instance!
            .addPostFrameCallback((_) => detector(overflowHeight));
        return Text.rich(
          span,
          overflow: overflow,
        );
      },
    );
  }
}
