import 'package:example/pages/pages.dart';
import 'package:flutter/material.dart';

class Router {
  final Map<String, Widget Function(BuildContext context)> pushRoutes = {
    OverflowDetectableTextPage.routeName: (context) =>
        const OverflowDetectableTextPage(),
  };

  Route handle(RouteSettings settings) {
    final name = settings.name;
    final uri = Uri(path: name);
    final segments = uri.pathSegments;
    final path = '/${segments.first}';
    final pushPage = pushRoutes[path];
    if (pushPage != null) {
      return MaterialPageRoute(
        settings: settings,
        builder: pushPage,
      );
    }
    return null;
  }
}
