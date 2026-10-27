import 'package:material_ui/material_ui.dart';

import 'modal_page_route.dart';

class FadePageRoute<T>({
  required super.builder,
  super.settings,
}) extends ModalPageRoute<T> {
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
