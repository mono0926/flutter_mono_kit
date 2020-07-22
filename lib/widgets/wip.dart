import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

const double _kHeight = 12;
const Color _kColor = Color(0xA0B71C1C);
const TextStyle _kTextStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: _kHeight * 0.85,
  fontWeight: FontWeight.w900,
  height: 1,
);

class WIP extends SingleChildStatelessWidget {
  const WIP({
    Key key,
    @required Widget child,
    this.location = BannerLocation.topEnd,
    this.color,
    this.textStyle,
    this.backgroundColor,
    this.visible = false,
  }) : super(key: key, child: child);

  final bool visible;
  final BannerLocation location;
  final Color color;
  final Color backgroundColor;
  final TextStyle textStyle;

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    if (!visible) {
      return const SizedBox.shrink();
    }
    final color = this.color ?? _kColor;
    return Banner(
      message: 'WIP',
      location: location,
      color: color,
      textStyle: textStyle ?? _kTextStyle,
      child: ColoredBox(
        color: backgroundColor ?? color.withOpacity(0.1),
        child: child,
      ),
    );
  }
}
