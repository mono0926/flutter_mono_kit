import 'package:flutter/material.dart';
import 'package:mono_kit/utils/logger.dart';
import 'package:nested/nested.dart';

class DebugPadding extends SingleChildStatelessWidget {
  const DebugPadding({
    super.key,
    super.child,
    this.showPadding = true,
    this.showViewPadding = true,
    this.showViewInsets = true,
    this.showSize = true,
  });

  final bool showPadding;
  final bool showViewPadding;
  final bool showViewInsets;
  final bool showSize;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    final mediaQuery = MediaQuery.of(context);
    return Stack(
      children: [
        child!,
        if (showPadding)
          _Padding(
            label: 'padding',
            color: Colors.red,
            padding: mediaQuery.padding,
            alignment: Alignment.topLeft,
          ),
        if (showViewPadding)
          _Padding(
            label: 'viewPadding',
            color: Colors.blue,
            padding: mediaQuery.viewPadding,
            alignment: Alignment.topRight,
          ),
        if (showViewInsets)
          _Padding(
            label: 'viewInsets',
            color: Colors.green,
            padding: mediaQuery.viewInsets,
            alignment: Alignment.center,
          ),
        if (showSize) const _Size(),
      ],
    );
  }
}

class _Size extends StatelessWidget {
  const _Size();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Positioned(
      right: 0,
      bottom: mediaQuery.viewInsets.bottom,
      child: ColoredBox(
        color: colorScheme.surface,
        child: Text(
          'size\n${mediaQuery.size}',
          style: theme.textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class _Padding extends StatelessWidget {
  const _Padding({
    required this.label,
    required this.color,
    required this.padding,
    required this.alignment,
  });

  final String label;
  final Color color;
  final EdgeInsets padding;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    logger.fine('${label.padRight(12)}: $padding');
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return IgnorePointer(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color.withValues(alpha: 0.8),
            width: 4,
          ),
          color: color.withValues(alpha: 0.2),
        ),
        margin: padding,
        child: Align(
          alignment: alignment,
          child: ColoredBox(
            color: colorScheme.surface,
            child: Text(
              '$label\n${padding.toString().replaceAll('EdgeInsets', '')}',
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
