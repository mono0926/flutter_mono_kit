// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homeRoute];

RouteBase get $homeRoute => GoRouteData.$route(
  path: '/',
  factory: $HomeRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'delayed-pop-scope',
      factory: $DelayedPopScopeRoute._fromState,
    ),
    GoRouteData.$route(path: 'snack-bar', factory: $SnackBarRoute._fromState),
    GoRouteData.$route(
      path: 'app-bottom-area',
      factory: $AppBottomAreaRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'debug-padding',
      factory: $DebugPaddingRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'overflow-detectable-text',
      factory: $OverflowDetectableTextRoute._fromState,
    ),
    GoRouteData.$route(path: 'barrier', factory: $BarrierRoute._fromState),
    GoRouteData.$route(
      path: 'unfocus-on-tap',
      factory: $UnfocusOnTapRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'lifecycle-observer',
      factory: $LifecycleObserverRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'paging-scroll',
      factory: $PagingScrollRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'banner-visibility',
      factory: $BannerVisibilityRoute._fromState,
    ),
    GoRouteData.$route(path: 'color-ex', factory: $ColorExRoute._fromState),
    GoRouteData.$route(
      path: 'max-width-padding-builder',
      factory: $MaxWidthPaddingBuilderRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'better-placeholder',
      factory: $BetterPlaceholderRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'loading-switcher',
      factory: $LoadingSwitcherRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'list-tile-selected-background-colored-box',
      factory: $ListTileSelectedBackgroundColoredBoxRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'vertical-center-scroll-view',
      factory: $VerticalCenterScrollViewRoute._fromState,
    ),
  ],
);

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $DelayedPopScopeRoute on GoRouteData {
  static DelayedPopScopeRoute _fromState(GoRouterState state) =>
      const DelayedPopScopeRoute();

  @override
  String get location => GoRouteData.$location('/delayed-pop-scope');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SnackBarRoute on GoRouteData {
  static SnackBarRoute _fromState(GoRouterState state) => const SnackBarRoute();

  @override
  String get location => GoRouteData.$location('/snack-bar');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AppBottomAreaRoute on GoRouteData {
  static AppBottomAreaRoute _fromState(GoRouterState state) =>
      const AppBottomAreaRoute();

  @override
  String get location => GoRouteData.$location('/app-bottom-area');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $DebugPaddingRoute on GoRouteData {
  static DebugPaddingRoute _fromState(GoRouterState state) =>
      const DebugPaddingRoute();

  @override
  String get location => GoRouteData.$location('/debug-padding');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $OverflowDetectableTextRoute on GoRouteData {
  static OverflowDetectableTextRoute _fromState(GoRouterState state) =>
      const OverflowDetectableTextRoute();

  @override
  String get location => GoRouteData.$location('/overflow-detectable-text');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BarrierRoute on GoRouteData {
  static BarrierRoute _fromState(GoRouterState state) => const BarrierRoute();

  @override
  String get location => GoRouteData.$location('/barrier');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $UnfocusOnTapRoute on GoRouteData {
  static UnfocusOnTapRoute _fromState(GoRouterState state) =>
      const UnfocusOnTapRoute();

  @override
  String get location => GoRouteData.$location('/unfocus-on-tap');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $LifecycleObserverRoute on GoRouteData {
  static LifecycleObserverRoute _fromState(GoRouterState state) =>
      const LifecycleObserverRoute();

  @override
  String get location => GoRouteData.$location('/lifecycle-observer');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PagingScrollRoute on GoRouteData {
  static PagingScrollRoute _fromState(GoRouterState state) =>
      const PagingScrollRoute();

  @override
  String get location => GoRouteData.$location('/paging-scroll');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BannerVisibilityRoute on GoRouteData {
  static BannerVisibilityRoute _fromState(GoRouterState state) =>
      const BannerVisibilityRoute();

  @override
  String get location => GoRouteData.$location('/banner-visibility');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ColorExRoute on GoRouteData {
  static ColorExRoute _fromState(GoRouterState state) => const ColorExRoute();

  @override
  String get location => GoRouteData.$location('/color-ex');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MaxWidthPaddingBuilderRoute on GoRouteData {
  static MaxWidthPaddingBuilderRoute _fromState(GoRouterState state) =>
      const MaxWidthPaddingBuilderRoute();

  @override
  String get location => GoRouteData.$location('/max-width-padding-builder');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BetterPlaceholderRoute on GoRouteData {
  static BetterPlaceholderRoute _fromState(GoRouterState state) =>
      const BetterPlaceholderRoute();

  @override
  String get location => GoRouteData.$location('/better-placeholder');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $LoadingSwitcherRoute on GoRouteData {
  static LoadingSwitcherRoute _fromState(GoRouterState state) =>
      const LoadingSwitcherRoute();

  @override
  String get location => GoRouteData.$location('/loading-switcher');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ListTileSelectedBackgroundColoredBoxRoute on GoRouteData {
  static ListTileSelectedBackgroundColoredBoxRoute _fromState(
    GoRouterState state,
  ) => const ListTileSelectedBackgroundColoredBoxRoute();

  @override
  String get location =>
      GoRouteData.$location('/list-tile-selected-background-colored-box');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $VerticalCenterScrollViewRoute on GoRouteData {
  static VerticalCenterScrollViewRoute _fromState(GoRouterState state) =>
      const VerticalCenterScrollViewRoute();

  @override
  String get location => GoRouteData.$location('/vertical-center-scroll-view');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
