import 'package:flutter/material.dart';

class ListTileSelectedBackgroundColoredBox extends StatelessWidget {
  const ListTileSelectedBackgroundColoredBox({
    Key? key,
    required this.listTile,
    this.color,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  final ListTile listTile;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: padding ?? const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: borderRadius ??
            const BorderRadius.horizontal(
              right: Radius.circular(1000),
            ),
        // Needed for ripple effect clipping
        child: Material(
          type: MaterialType.transparency,
          child: ColoredBox(
            color: listTile.selected
                ? color ?? colorScheme.primary.withOpacity(0.1)
                : Colors.transparent,
            child: listTile,
          ),
        ),
      ),
    );
  }
}
