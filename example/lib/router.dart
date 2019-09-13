import 'package:example/pages/life_cycle_observer_page.dart';
import 'package:example/pages/pages.dart';
import 'package:example/pages/unfocus_on_tap_page.dart';
import 'package:flutter/material.dart';

import 'pages/progress_mixin_page.dart';

class Router {
  final Map<String, WidgetBuilder> pushRoutes = {
    OverflowDetectableTextPage.routeName: (context) =>
        const OverflowDetectableTextPage(),
    ProgressMixinPage.routeName: (context) => ProgressMixinPage.withModel(),
    UnfocusOnTapPage.routeName: (context) => const UnfocusOnTapPage(),
    LifeCycleObserverPage.routeName: (context) =>
        LifeCycleObserverPage.wrapped(),
  };

  Route handle(RouteSettings settings) {
    final name = settings.name;
    final uri = Uri(path: name);
    final segments = uri.pathSegments;
    final path = '/${segments.first}';
    final pushPage = pushRoutes[path];
    if (pushPage != null) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: pushPage,
      );
    }
    return null;
  }
}
