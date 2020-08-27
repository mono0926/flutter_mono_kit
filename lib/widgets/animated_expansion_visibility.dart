import 'package:flutter/material.dart';

class AnimatedExpansionVisibility extends ImplicitlyAnimatedWidget {
  const AnimatedExpansionVisibility({
    Key key,
    @required this.child,
    @required this.isVisible,
    this.alignment,
    Duration duration,
    Curve curve,
  }) : super(
          key: key,
          duration: duration ?? const Duration(milliseconds: 200),
          curve: curve ?? Curves.linear,
        );

  final Widget child;
  final bool isVisible;
  final Alignment alignment;

  @override
  _AnimatedExpansionVisibilityState createState() =>
      _AnimatedExpansionVisibilityState();
}

class _AnimatedExpansionVisibilityState
    extends AnimatedWidgetBaseState<AnimatedExpansionVisibility> {
  Tween<double> _heightFactorTween;

  @override
  Widget build(BuildContext context) {
    final heightFactor = _heightFactorTween.evaluate(animation);
    return Visibility(
      visible: heightFactor != 0,
      child: ClipRect(
        child: Align(
          alignment: widget.alignment ?? Alignment.bottomCenter,
          heightFactor: heightFactor,
          child: widget.child,
        ),
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _heightFactorTween = visitor(
      _heightFactorTween,
      widget.isVisible ? 1.0 : 0.0,
      (dynamic heightFactor) => Tween<double>(begin: heightFactor as double),
    ) as Tween<double>;
  }
}
