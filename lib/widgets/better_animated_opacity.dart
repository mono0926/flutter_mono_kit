import 'package:flutter/widgets.dart';

import 'widgets.dart';

class BetterAnimatedOpacity extends ImplicitlyAnimatedWidget {
  const BetterAnimatedOpacity({
    Key key,
    this.child,
    @required this.opacity,
    Curve curve = Curves.linear,
    @required Duration duration,
  })  : assert(opacity != null && opacity >= 0.0 && opacity <= 1.0),
        super(key: key, curve: curve, duration: duration);

  final Widget child;
  final double opacity;

  @override
  _AnimatedOpacityState createState() => _AnimatedOpacityState();
}

class _AnimatedOpacityState
    extends ImplicitlyAnimatedWidgetState<BetterAnimatedOpacity> {
  Tween<double> _opacity;
  Animation<double> _opacityAnimation;

  @override
  void forEachTween(TweenVisitor visitor) {
    _opacity = visitor(
      _opacity,
      widget.opacity,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>;
  }

  @override
  void didUpdateTweens() {
    _opacityAnimation = animation.drive(_opacity);
  }

  @override
  Widget build(BuildContext context) {
    return BetterFadeTransition(
      opacity: _opacityAnimation,
      child: widget.child,
    );
  }
}
