import 'package:flutter/widgets.dart';

class BetterFadeTransition extends AnimatedWidget {
  const BetterFadeTransition({
    super.key,
    required this.child,
    required Animation<double> opacity,
    this.alwaysIncludeSemantics = false,
  }) : super(
          listenable: opacity,
        );

  final Widget child;
  final bool alwaysIncludeSemantics;

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
