import 'package:material_ui/material_ui.dart';

/// A [PageTransitionsBuilder] that disables page transition animations.
class const NoAnimationPageTransitionsBuilder() extends PageTransitionsBuilder {
  @override
  Duration get transitionDuration => Duration.zero;

  @override
  Duration get reverseTransitionDuration => Duration.zero;

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => child;
}
