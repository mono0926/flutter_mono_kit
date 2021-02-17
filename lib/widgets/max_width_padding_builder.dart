import 'dart:math';

import 'package:flutter/material.dart';

typedef PaddingWidgetBuilder = Widget Function(
    BuildContext context, EdgeInsets padding);

class MaxWidthPaddingBuilder extends StatelessWidget {
  const MaxWidthPaddingBuilder({
    Key? key,
    this.width = 768,
    required this.builder,
  }) : super(key: key);

  final double width;
  final PaddingWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(
          context,
          EdgeInsets.symmetric(
            horizontal: max(0, constraints.maxWidth - width) / 2,
          ),
        );
      },
    );
  }
}
