import 'package:material_ui/material_ui.dart';

class const AnimatedExpansionVisibility({
  super.key,
  final Widget? child,
  required final bool isVisible,
  final double axisAlignment = 1,
  Duration? duration,
  Curve? curve,
}) extends ImplicitlyAnimatedWidget {
  this
    : super(
        duration: duration ?? const Duration(milliseconds: 200),
        curve: curve ?? Curves.linear,
      );

  @override
  AnimatedWidgetBaseState<AnimatedExpansionVisibility> createState() =>
      _AnimatedExpansionVisibilityState();
}

class _AnimatedExpansionVisibilityState()
    extends AnimatedWidgetBaseState<AnimatedExpansionVisibility> {
  Tween<double>? _heightFactorTween;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _heightFactorTween!.animate(animation),
      alignment: Alignment(0, widget.axisAlignment),
      child: widget.child,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _heightFactorTween =
        visitor(
              _heightFactorTween,
              widget.isVisible ? 1.0 : 0.0,
              (dynamic heightFactor) =>
                  Tween<double>(begin: heightFactor as double),
            )!
            as Tween<double>;
  }
}
