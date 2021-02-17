import 'package:flutter/widgets.dart';

class BetterFadeTransition extends AnimatedWidget {
  const BetterFadeTransition({
    Key? key,
    required this.child,
    required Animation<double> opacity,
    this.alwaysIncludeSemantics = false,
  }) : super(
          key: key,
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
        child: child,
        alwaysIncludeSemantics: alwaysIncludeSemantics,
      ),
    );
  }
}
