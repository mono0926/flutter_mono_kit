import 'package:flutter/widgets.dart';
import 'package:nested/nested.dart';

class TextScaleFactor extends SingleChildStatelessWidget {
  @Deprecated('Use `MediaQuery.withClampedTextScaling()` directly instead.')
  const TextScaleFactor({
    super.key,
    super.child,
    this.min = 1,
    this.max,
  });

  final double? min;
  final double? max;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return MediaQuery.withClampedTextScaling(
      minScaleFactor: min ?? 0,
      maxScaleFactor: max ?? double.infinity,
      child: child!,
    );
  }
}
