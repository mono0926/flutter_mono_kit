import 'package:flutter/widgets.dart';

import 'widgets.dart';

class const BetterAnimatedOpacity({
  super.key,
  required final Widget child,
  required final double opacity,
  super.curve,
  required super.duration,
}) extends ImplicitlyAnimatedWidget {
  this : assert(opacity >= 0.0 && opacity <= 1.0);

  @override
  ImplicitlyAnimatedWidgetState<BetterAnimatedOpacity> createState() =>
      _AnimatedOpacityState();
}

class _AnimatedOpacityState()
    extends ImplicitlyAnimatedWidgetState<BetterAnimatedOpacity> {
  Tween<double>? _opacity;
  late Animation<double> _opacityAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _opacity =
        visitor(
              _opacity,
              widget.opacity,
              (dynamic value) => Tween<double>(begin: value as double),
            )!
            as Tween<double>;
  }

  @override
  void didUpdateTweens() {
    _opacityAnimation = animation.drive(_opacity!);
  }

  @override
  Widget build(BuildContext context) {
    return BetterFadeTransition(
      opacity: _opacityAnimation,
      child: widget.child,
    );
  }
}
