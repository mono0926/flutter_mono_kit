// ignore_for_file: remove_deprecations_in_breaking_versions

import 'package:flutter/widgets.dart';
import 'package:nested/nested.dart';

class const TextScaleFactor({
  super.key,
  super.child,
  final double? min = 1,
  final double? max,
}) extends SingleChildStatelessWidget {
  @Deprecated('Use `MediaQuery.withClampedTextScaling()` directly instead.')
  this;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return MediaQuery.withClampedTextScaling(
      minScaleFactor: min ?? 0,
      maxScaleFactor: max ?? double.infinity,
      child: child!,
    );
  }
}
