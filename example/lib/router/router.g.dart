// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'delayed-pop-scope',
          factory: $DelayedPopScopeRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'snack-bar',
          factory: $SnackBarRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'app-bottom-area',
          factory: $AppBottomAreaRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'debug-padding',
          factory: $DebugPaddingRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'overflow-detectable-text',
          factory: $OverflowDetectableTextRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'barrier',
          factory: $BarrierRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'unfocus-on-tap',
          factory: $UnfocusOnTapRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'life-cycle-observer',
          factory: $LifecycleObserverRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'paging-scroll',
          factory: $PagingScrollRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'banner-visibility',
          factory: $BannerVisibilityRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'color-ex',
          factory: $ColorExRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'max-width-padding-builder',
          factory: $MaxWidthPaddingBuilderRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'better-placeholder',
          factory: $BetterPlaceholderRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'loading-switcher',
          factory: $LoadingSwitcherRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'list-tile-selected-background-colored-box',
          factory:
              $ListTileSelectedBackgroundColoredBoxRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'vertical-center-scroll-view',
          factory: $VerticalCenterScrollViewRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DelayedPopScopeRouteExtension on DelayedPopScopeRoute {
  static DelayedPopScopeRoute _fromState(GoRouterState state) =>
      const DelayedPopScopeRoute();

  String get location => GoRouteData.$location(
        '/delayed-pop-scope',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SnackBarRouteExtension on SnackBarRoute {
  static SnackBarRoute _fromState(GoRouterState state) => const SnackBarRoute();

  String get location => GoRouteData.$location(
        '/snack-bar',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppBottomAreaRouteExtension on AppBottomAreaRoute {
  static AppBottomAreaRoute _fromState(GoRouterState state) =>
      const AppBottomAreaRoute();

  String get location => GoRouteData.$location(
        '/app-bottom-area',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DebugPaddingRouteExtension on DebugPaddingRoute {
  static DebugPaddingRoute _fromState(GoRouterState state) =>
      const DebugPaddingRoute();

  String get location => GoRouteData.$location(
        '/debug-padding',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $OverflowDetectableTextRouteExtension on OverflowDetectableTextRoute {
  static OverflowDetectableTextRoute _fromState(GoRouterState state) =>
      const OverflowDetectableTextRoute();

  String get location => GoRouteData.$location(
        '/overflow-detectable-text',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BarrierRouteExtension on BarrierRoute {
  static BarrierRoute _fromState(GoRouterState state) => const BarrierRoute();

  String get location => GoRouteData.$location(
        '/barrier',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UnfocusOnTapRouteExtension on UnfocusOnTapRoute {
  static UnfocusOnTapRoute _fromState(GoRouterState state) =>
      const UnfocusOnTapRoute();

  String get location => GoRouteData.$location(
        '/unfocus-on-tap',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LifecycleObserverRouteExtension on LifecycleObserverRoute {
  static LifecycleObserverRoute _fromState(GoRouterState state) =>
      const LifecycleObserverRoute();

  String get location => GoRouteData.$location(
        '/life-cycle-observer',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PagingScrollRouteExtension on PagingScrollRoute {
  static PagingScrollRoute _fromState(GoRouterState state) =>
      const PagingScrollRoute();

  String get location => GoRouteData.$location(
        '/paging-scroll',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BannerVisibilityRouteExtension on BannerVisibilityRoute {
  static BannerVisibilityRoute _fromState(GoRouterState state) =>
      const BannerVisibilityRoute();

  String get location => GoRouteData.$location(
        '/banner-visibility',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ColorExRouteExtension on ColorExRoute {
  static ColorExRoute _fromState(GoRouterState state) => const ColorExRoute();

  String get location => GoRouteData.$location(
        '/color-ex',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MaxWidthPaddingBuilderRouteExtension on MaxWidthPaddingBuilderRoute {
  static MaxWidthPaddingBuilderRoute _fromState(GoRouterState state) =>
      const MaxWidthPaddingBuilderRoute();

  String get location => GoRouteData.$location(
        '/max-width-padding-builder',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BetterPlaceholderRouteExtension on BetterPlaceholderRoute {
  static BetterPlaceholderRoute _fromState(GoRouterState state) =>
      const BetterPlaceholderRoute();

  String get location => GoRouteData.$location(
        '/better-placeholder',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoadingSwitcherRouteExtension on LoadingSwitcherRoute {
  static LoadingSwitcherRoute _fromState(GoRouterState state) =>
      const LoadingSwitcherRoute();

  String get location => GoRouteData.$location(
        '/loading-switcher',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ListTileSelectedBackgroundColoredBoxRouteExtension
    on ListTileSelectedBackgroundColoredBoxRoute {
  static ListTileSelectedBackgroundColoredBoxRoute _fromState(
          GoRouterState state) =>
      const ListTileSelectedBackgroundColoredBoxRoute();

  String get location => GoRouteData.$location(
        '/list-tile-selected-background-colored-box',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $VerticalCenterScrollViewRouteExtension
    on VerticalCenterScrollViewRoute {
  static VerticalCenterScrollViewRoute _fromState(GoRouterState state) =>
      const VerticalCenterScrollViewRoute();

  String get location => GoRouteData.$location(
        '/vertical-center-scroll-view',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
