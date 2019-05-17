import 'package:flutter/material.dart';

import 'modal_page_route.dart';

class FadePageRoute extends ModalPageRoute {
  FadePageRoute({
    Key key,
    @required WidgetBuilder builder,
    @required RouteSettings settings,
  }) : super(
          key: key,
          builder: builder,
          settings: settings,
        );

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
