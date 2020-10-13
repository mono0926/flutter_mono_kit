## 0.18.0-dev

- Add SnackBarPresenterEx

## 0.17.2

- Add UnexpectedError

## 0.17.1

- Add extensions

## 0.17.0

- Depends on hooks_riverpod instead of provider

## 0.16.3

- Add AppBottomArea

## 0.16.2

- Delete descendantContext of NavigatorStateEx in favor of https://github.com/flutter/flutter/pull/58259

## 0.16.1

- Delete ScaffoldStateEx
  - Use snack_bar_presenter](https://pub.dev/packages/snack_bar_presenter) instead

## 0.16.0

- Update flutter_svg to 0.18.0

## 0.15.7+1

- Fix TilePadding top/bottom SafeArea

## 0.15.7

- Change default color of WIP
- Clip WIP

## 0.15.6

- Add WIP

## 0.15.5

- Set pageTransitionsTheme to ZoomPageTransitionsBuilder except for Cupertino

## 0.15.4

- Add some extensions

## 0.15.3

- Add TilePadding

## 0.15.2

- Remove `device_simulator` dependency

## 0.15.1

- Change `showSimpleSnackBar` return type to `ScaffoldFeatureController<SnackBar, SnackBarClosedReason>` from `void`

## 0.15.0

- Change `showPhotoSelectionSheet`'s return type to `Future<PickedFile>` from `Future<File>`
  - Follow this migration guide: https://pub.dev/packages/image_picker#how-to-migrate-from-to-067

## 0.14.1

- Remove @required of `settings` for `FadePageRoute`

## 0.14.0

- Re-land `Swap englishLike bodyText1 and bodyText2`.

## 0.13.6

- Revert `Swap englishLike bodyText1 and bodyText2`

## 0.13.5

- Update Flutter version

## 0.13.4

- Swap englishLike bodyText1 and bodyText2.

## 0.13.3

- Add AppAssetImage

## 0.13.2

- Rename to followLatestSpec from appliedCommon

## 0.13.1

- Add ThemeDataEx and which contains appliedCommon()

## 0.13.0

- Refactor TextInputDialog
- Migrate to AndroidX

## 0.12.4

- Add LoadingSwitcher
- Add TimeoutSwitcher
- Add BetterPlaceholder

## 0.12.3

- Call `updateProgress(inProgress: false)` even if error occurred.

## 0.12.2

- Add MaxWidthPaddingBuilder

## 0.12.1

- Add TextInputDialog

## 0.12.0

- Update provider to 4.0.0

## 0.11.1

- Add valueColor to Barrier

## 0.11.0

- Upgrade dependencies

## 0.10.0

- Support Flutter 1.12.13 or higher
- Add several utilities

## 0.9.5

- Change to PagingScrollController from PagingScroll Widget

## 0.9.4

- Add PagingScroll

## 0.9.3

- Add CenteredMaxWidth

## 0.9.2

- Add pedantic_mono dependency

## 0.9.1

- Add buildMode

## 0.9.0

- Add LifeCycleObserver

## 0.8.0

- Add UnfocusOnTap

## 0.7.2

- Update dependencies

## 0.7.1

- Update dependencies

## 0.7.0

- Add ProgressMixin

## 0.6.0

- Add Barrier Barrier.value named constructor which accepts bool.

## 0.5.0

- Delete ValueObservableBuilder's reuseChild and always call builder
    - https://gist.github.com/mono0926/52c8441960cdd5b62aaf31d9eb336072#gistcomment-2994116

## 0.4.0

- Delete BetterStreamBuilder's reuseChild and always call builder
    - https://gist.github.com/mono0926/52c8441960cdd5b62aaf31d9eb336072#gistcomment-2994116

## 0.3.0

- Delete RouteObserverProvider/RouteObserveMixin.
    - Move to route_observer_mixin(https://pub.dev/packages/route_observer_mixin) instead.

## 0.2.0

- Refactor RouteObserverProvider with provider and add its example.

## 0.1.1+1

- Make TextAnswerDialogResult to private

## 0.1.1

- Change `TextAnswerDialog`'s return type to Future<bool> instead of accepting onCompleted callback.

## 0.1.0

- Increment version.

## 0.0.6

- Add `TextAnswerDialog`.

## 0.0.5

- Add `reuseChild` argument to BetterStreamBuilder/ValueObservableBuilder.

## 0.0.4

- Add type parameter to FadePageRoute.

## 0.0.3

- Change OverflowDetectableText's callback argument to double from bool in order to notify overflowed height.

## 0.0.2

- Add BetterStreamBuilder

## 0.0.1

- Port my private repository's source codes.
