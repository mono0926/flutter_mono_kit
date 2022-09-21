import 'package:flutter/material.dart';

class AnimatedExpansionVisibility extends ImplicitlyAnimatedWidget {
  const AnimatedExpansionVisibility({
    super.key,
    this.child,
    required this.isVisible,
    this.axisAlignment = 1,
    Duration? duration,
    Curve? curve,
  }) : super(
          duration: duration ?? const Duration(milliseconds: 200),
          curve: curve ?? Curves.linear,
        );

  final Widget? child;
  final bool isVisible;
  final double axisAlignment;

  @override
  AnimatedWidgetBaseState<AnimatedExpansionVisibility> createState() =>
      _AnimatedExpansionVisibilityState();
}

class _AnimatedExpansionVisibilityState
    extends AnimatedWidgetBaseState<AnimatedExpansionVisibility> {
  Tween<double>? _heightFactorTween;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _heightFactorTween!.animate(animation),
      axisAlignment: widget.axisAlignment,
      child: widget.child,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _heightFactorTween = visitor(
      _heightFactorTween,
      widget.isVisible ? 1.0 : 0.0,
      (dynamic heightFactor) => Tween<double>(begin: heightFactor as double),
    )! as Tween<double>;
  }
}
