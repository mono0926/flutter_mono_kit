import 'package:material_ui/material_ui.dart';

class const ListTileSelectedBackgroundColoredBox({
  super.key,
  required final ListTile listTile,
  final Color? color,
  final EdgeInsetsGeometry? padding,
  final BorderRadius? borderRadius,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: padding ?? const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius:
            borderRadius ??
            const BorderRadius.horizontal(right: Radius.circular(1000)),
        // Needed for ripple effect clipping
        child: Material(
          type: MaterialType.transparency,
          child: ColoredBox(
            color: listTile.selected
                ? color ?? colorScheme.primary.withValues(alpha: 0.1)
                : Colors.transparent,
            child: listTile,
          ),
        ),
      ),
    );
  }
}
