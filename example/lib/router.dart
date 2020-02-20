import 'package:example/pages/banner_visibility_page.dart';
import 'package:example/pages/barrier_page.dart';
import 'package:example/pages/better_placeholder_page.dart';
import 'package:example/pages/color_ex_page.dart';
import 'package:example/pages/life_cycle_observer_page.dart';
import 'package:example/pages/loading_switcher_page.dart';
import 'package:example/pages/max_width_padding_builder_page.dart';
import 'package:example/pages/overflow_detectable_text_page/overflow_detectable_text_page.dart';
import 'package:example/pages/paging_scroll_page.dart';
import 'package:example/pages/text_input_dialog_page.dart';
import 'package:example/pages/unfocus_on_tap_page.dart';
import 'package:flutter/material.dart';

class Router {
  final Map<String, WidgetBuilder> pushRoutes = {
    OverflowDetectableTextPage.routeName: (context) =>
        const OverflowDetectableTextPage(),
    BarrierPage.routeName: (context) => BarrierPage(),
    UnfocusOnTapPage.routeName: (context) => const UnfocusOnTapPage(),
    LifeCycleObserverPage.routeName: (context) =>
        LifeCycleObserverPage.wrapped(),
    PagingScrollPage.routeName: (context) => const PagingScrollPage(),
    BannerVisibilityPage.routeName: (context) => const BannerVisibilityPage(),
    ColorExPage.routeName: (context) => const ColorExPage(),
    TextInputDialogPage.routeName: (context) => const TextInputDialogPage(),
    MaxWidthPaddingBuilderPage.routeName: (context) =>
        const MaxWidthPaddingBuilderPage(),
    BetterPlaceholderPage.routeName: (context) => const BetterPlaceholderPage(),
    LoadingSwitcherPage.routeName: (context) => LoadingSwitcherPage.wrapped(),
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
