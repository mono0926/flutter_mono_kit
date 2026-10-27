import 'package:material_ui/material_ui.dart';
import 'package:nested/nested.dart';

const double _kHeight = 12;
const _kColor = Color(0xFFF57F17);
const _kTextStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: _kHeight * 0.85,
  fontWeight: FontWeight.w900,
  height: 1,
);

class const WIP({
  super.key,
  required Widget super.child,
  final BannerLocation location = BannerLocation.topEnd,
  final Color? color,
  final TextStyle? textStyle,
  final Color? backgroundColor,
  final bool visible = false,
  final String? message,
}) extends SingleChildStatelessWidget {
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
