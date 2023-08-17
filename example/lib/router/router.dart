import 'package:example/pages/app_bottom_area_page.dart';
import 'package:example/pages/banner_visibility_page.dart';
import 'package:example/pages/barrier_page.dart';
import 'package:example/pages/better_placeholder_page.dart';
import 'package:example/pages/color_ex_page.dart';
import 'package:example/pages/debug_padding_page.dart';
import 'package:example/pages/home_page.dart';
import 'package:example/pages/lifecycle_observer_page.dart';
import 'package:example/pages/list_tile_selected_background_colored_box_page.dart';
import 'package:example/pages/loading_switcher_page.dart';
import 'package:example/pages/max_width_padding_builder_page.dart';
import 'package:example/pages/overflow_detectable_text_page/overflow_detectable_text_page.dart';
import 'package:example/pages/paging_scroll_page.dart';
import 'package:example/pages/snack_bar_page.dart';
import 'package:example/pages/unfocus_on_tap_page.dart';
import 'package:example/pages/vertical_center_scroll_view_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:recase/recase.dart';

part 'router.g.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    routes: [
      ShellRoute(
        routes: $appRoutes,
        builder: goRouteLocationButtonNavigationBuilder,
      ),
    ],
    debugLogDiagnostics: kDebugMode,
    // errorBuilder: (_, __) => const NotFoundPage(),
  ),
);

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<SnackBarRoute>(path: 'snack-bar'),
    TypedGoRoute<AppBottomAreaRoute>(path: 'app-bottom-area'),
    TypedGoRoute<DebugPaddingRoute>(path: 'debug-padding'),
    TypedGoRoute<OverflowDetectableTextRoute>(path: 'overflow-detectable-text'),
    TypedGoRoute<BarrierRoute>(path: 'barrier'),
    TypedGoRoute<UnfocusOnTapRoute>(path: 'unfocus-on-tap'),
    TypedGoRoute<LifecycleObserverRoute>(path: 'life-cycle-observer'),
    TypedGoRoute<PagingScrollRoute>(path: 'paging-scroll'),
    TypedGoRoute<BannerVisibilityRoute>(path: 'banner-visibility'),
    TypedGoRoute<ColorExRoute>(path: 'color-ex'),
    TypedGoRoute<MaxWidthPaddingBuilderRoute>(
      path: 'max-width-padding-builder',
    ),
    TypedGoRoute<BetterPlaceholderRoute>(path: 'better-placeholder'),
    TypedGoRoute<LoadingSwitcherRoute>(path: 'loading-switcher'),
    TypedGoRoute<ListTileSelectedBackgroundColoredBoxRoute>(
      path: 'list-tile-selected-background-colored-box',
    ),
    TypedGoRoute<VerticalCenterScrollViewRoute>(
      path: 'vertical-center-scroll-view',
    ),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

String pascalCaseFromRouteName(String name) => name.pascalCase;
String pascalCaseFromRouteUri(Uri uri) =>
    pascalCaseFromRouteName(uri.toString());

List<String> get allRouteLocations => [
      const SnackBarRoute().location,
      const AppBottomAreaRoute().location,
      const DebugPaddingRoute().location,
      const OverflowDetectableTextRoute().location,
      const BarrierRoute().location,
      const UnfocusOnTapRoute().location,
      const LifecycleObserverRoute().location,
      const PagingScrollRoute().location,
      const BannerVisibilityRoute().location,
      const ColorExRoute().location,
      const MaxWidthPaddingBuilderRoute().location,
      const BetterPlaceholderRoute().location,
      const LoadingSwitcherRoute().location,
      const ListTileSelectedBackgroundColoredBoxRoute().location,
      const VerticalCenterScrollViewRoute().location,
    ];
