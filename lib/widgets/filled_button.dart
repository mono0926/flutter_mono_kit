import 'package:flutter/material.dart';

class FilledButton extends _FilledButton {
  const FilledButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    required super.child,
  }) : super(type: _ButtonType.filled);

  static ButtonStyle styleFrom({
    Color? primary,
    Color? onPrimary,
    Color? onSurface,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Size? fixedSize,
    Size? maximumSize,
    BorderSide? side,
    OutlinedBorder? shape,
    MouseCursor? enabledMouseCursor,
    MouseCursor? disabledMouseCursor,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? tapTargetSize,
    Duration? animationDuration,
    bool? enableFeedback,
    AlignmentGeometry? alignment,
    InteractiveInkFeatureFactory? splashFactory,
  }) {
    return ElevatedButton.styleFrom(
      primary: primary,
      onPrimary: onPrimary,
      onSurface: onSurface,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      textStyle: textStyle,
      padding: padding,
      minimumSize: minimumSize,
      fixedSize: fixedSize,
      maximumSize: maximumSize,
      side: side,
      shape: shape,
      enabledMouseCursor: enabledMouseCursor,
      disabledMouseCursor: disabledMouseCursor,
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
      alignment: alignment,
      splashFactory: splashFactory,
    );
  }
}

class FilledTonalButton extends _FilledButton {
  const FilledTonalButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    required super.child,
  }) : super(type: _ButtonType.filledTonal);

  static ButtonStyle styleFrom({
    Color? primary,
    Color? onPrimary,
    Color? onSurface,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Size? fixedSize,
    Size? maximumSize,
    BorderSide? side,
    OutlinedBorder? shape,
    MouseCursor? enabledMouseCursor,
    MouseCursor? disabledMouseCursor,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? tapTargetSize,
    Duration? animationDuration,
    bool? enableFeedback,
    AlignmentGeometry? alignment,
    InteractiveInkFeatureFactory? splashFactory,
  }) {
    return ElevatedButton.styleFrom(
      primary: primary,
      onPrimary: onPrimary,
      onSurface: onSurface,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      textStyle: textStyle,
      padding: padding,
      minimumSize: minimumSize,
      fixedSize: fixedSize,
      maximumSize: maximumSize,
      side: side,
      shape: shape,
      enabledMouseCursor: enabledMouseCursor,
      disabledMouseCursor: disabledMouseCursor,
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
      alignment: alignment,
      splashFactory: splashFactory,
    );
  }
}

class _FilledButton extends ElevatedButton {
  const _FilledButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.clipBehavior,
    required this.type,
    required super.child,
  });

  final _ButtonType type;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final style = ElevatedButton.styleFrom(
      onPrimary: _onPrimary(colorScheme),
      primary: _primary(colorScheme),
    );
    return super.defaultStyleOf(context).copyWith(
          foregroundColor: style.foregroundColor,
          backgroundColor: style.backgroundColor,
          overlayColor: style.overlayColor,
          elevation: MaterialStateProperty.all(0),
        );
  }

  // https://github.com/darrenaustin/flutter/blob/d8435ca1e908b937c45ed54ba08bf97dc3312a1d/examples/api/lib/material/button_style/button_style.0.dart#L64-L86
  Color _primary(ColorScheme colorScheme) {
    switch (type) {
      case _ButtonType.filled:
        return colorScheme.primary;
      case _ButtonType.filledTonal:
        return colorScheme.secondaryContainer;
    }
  }

  Color _onPrimary(ColorScheme colorScheme) {
    switch (type) {
      case _ButtonType.filled:
        return colorScheme.onPrimary;
      case _ButtonType.filledTonal:
        return colorScheme.onSecondaryContainer;
    }
  }
}

enum _ButtonType {
  filled,
  filledTonal,
}
