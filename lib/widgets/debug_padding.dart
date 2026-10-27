import 'package:material_ui/material_ui.dart';
import 'package:mono_kit/utils/logger.dart';
import 'package:nested/nested.dart';

class const DebugPadding({
  super.key,
  super.child,
  final bool showPadding = true,
  final bool showViewPadding = true,
  final bool showViewInsets = true,
  final bool showSize = true,
}) extends SingleChildStatelessWidget {
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

class const _Size() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Positioned(
      right: 0,
      bottom: bottomInset,
      child: ColoredBox(
        color: colorScheme.surface,
        child: Text(
          'size\n$size',
          style: theme.textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class const _Padding({
  required final String label,
  required final Color color,
  required final EdgeInsets padding,
  required final Alignment alignment,
}) extends StatelessWidget {
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
