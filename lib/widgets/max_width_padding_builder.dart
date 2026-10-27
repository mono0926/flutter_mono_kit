import 'dart:math';

import 'package:material_ui/material_ui.dart';

typedef PaddingWidgetBuilder = Widget Function(
  BuildContext context,
  EdgeInsets padding,
);

class const MaxWidthPaddingBuilder({
  super.key,
  final double width = 768,
  required final PaddingWidgetBuilder builder,
}) extends StatelessWidget {
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
