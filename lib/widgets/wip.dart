import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

const double _kHeight = 12;
const _kColor = Color(0xFFF57F17);
const _kTextStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: _kHeight * 0.85,
  fontWeight: FontWeight.w900,
  height: 1,
);

class WIP extends SingleChildStatelessWidget {
  const WIP({
    super.key,
    required Widget super.child,
    this.location = BannerLocation.topEnd,
    this.color,
    this.textStyle,
    this.backgroundColor,
    this.visible = false,
    this.message,
  });

  final bool visible;
  final BannerLocation location;
  final Color? color;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final String? message;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    if (!visible) {
      return const SizedBox.shrink();
    }
    final color = this.color ?? _kColor;
    return ClipRRect(
      child: Banner(
        message: message ?? 'WIP',
        location: location,
        color: color,
        textStyle: textStyle ?? _kTextStyle,
        child: ColoredBox(
          color: backgroundColor ?? color.withValues(alpha: 0.1),
          child: child,
        ),
      ),
    );
  }
}
