import 'package:flutter/material.dart';

import 'modal_page_route.dart';

class FadePageRoute<T> extends ModalPageRoute<T> {
  FadePageRoute({
    required super.builder,
    super.settings,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }
}
