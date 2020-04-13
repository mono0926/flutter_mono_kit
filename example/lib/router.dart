import 'package:example/pages/banner_visibility_page.dart';
import 'package:example/pages/barrier_page.dart';
import 'package:example/pages/better_placeholder_page.dart';
import 'package:example/pages/color_ex_page.dart';
import 'package:example/pages/life_cycle_observer_page.dart';
import 'package:example/pages/list_tile_selected_background_colored_box_page.dart';
import 'package:example/pages/loading_switcher_page.dart';
import 'package:example/pages/max_width_padding_builder_page.dart';
import 'package:example/pages/overflow_detectable_text_page/overflow_detectable_text_page.dart';
import 'package:example/pages/paging_scroll_page.dart';
import 'package:example/pages/unfocus_on_tap_page.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class Router {
  final Map<String, WidgetBuilder> pushRoutes = {
    OverflowDetectableTextPage.routeName: (context) =>
        const OverflowDetectableTextPage(),
    BarrierPage.routeName: (context) => const BarrierPage(),
    UnfocusOnTapPage.routeName: (context) => const UnfocusOnTapPage(),
    LifeCycleObserverPage.routeName: (context) =>
        LifeCycleObserverPage.wrapped(),
    PagingScrollPage.routeName: (context) => const PagingScrollPage(),
    BannerVisibilityPage.routeName: (context) => const BannerVisibilityPage(),
    ColorExPage.routeName: (context) => const ColorExPage(),
    MaxWidthPaddingBuilderPage.routeName: (context) =>
        const MaxWidthPaddingBuilderPage(),
    BetterPlaceholderPage.routeName: (context) => const BetterPlaceholderPage(),
    LoadingSwitcherPage.routeName: (context) => LoadingSwitcherPage.wrapped(),
    ListTileSelectedBackgroundColoredBoxPage.routeName: (context) =>
        const ListTileSelectedBackgroundColoredBoxPage(),
  };

  Route onGenerateRoute(RouteSettings settings) {
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

String pascalCaseFromRouteName(String name) => name.substring(1).pascalCase;

@immutable
class PageInfo {
  const PageInfo({
    @required this.routeName,
  });

  final String routeName;

  static List<PageInfo> get all => [
        LifeCycleObserverPage.routeName,
        BarrierPage.routeName,
        UnfocusOnTapPage.routeName,
        OverflowDetectableTextPage.routeName,
        PagingScrollPage.routeName,
        BannerVisibilityPage.routeName,
        ColorExPage.routeName,
        MaxWidthPaddingBuilderPage.routeName,
        BetterPlaceholderPage.routeName,
        LoadingSwitcherPage.routeName,
        ListTileSelectedBackgroundColoredBoxPage.routeName,
      ].map((rn) => PageInfo(routeName: rn)).toList();
}
