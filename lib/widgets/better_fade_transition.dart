import 'package:flutter/widgets.dart';

class const BetterFadeTransition({
  super.key,
  required final Widget child,
  required Animation<double> opacity,
  final bool alwaysIncludeSemantics = false,
}) extends AnimatedWidget {
  this
    : super(
        listenable: opacity,
      );

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Visibility(
      visible: animation.value != 0,
      child: FadeTransition(
        opacity: animation,
        alwaysIncludeSemantics: alwaysIncludeSemantics,
        child: child,
      ),
    );
  }
}
