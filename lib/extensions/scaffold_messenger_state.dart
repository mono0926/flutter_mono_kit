import 'package:flutter/material.dart';

extension SnackBarPresenterEx on ScaffoldMessengerState {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage(
    String text,
  ) {
    return _show(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showUndo(
    String text, {
    required VoidCallback onUndo,
    required ThemeData theme,
    Color? undoButtonColor,
    SnackBarL10n l10n = const SnackBarL10n(),
  }) {
    return showMessageWithAction(
      text,
      onAction: onUndo,
      actionLabel: l10n.undo,
      actionColor: undoButtonColor,
      theme: theme,
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showMessageWithAction(
    String text, {
    required VoidCallback onAction,
    required String actionLabel,
    required ThemeData theme,
    Color? actionColor,
  }) {
    return _show(
      SnackBar(
        content: Text(text),
        action: SnackBarAction(
          textColor: actionColor ?? theme.colorScheme.inversePrimary,
          label: actionLabel,
          onPressed: onAction,
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError(
    dynamic error, {
    required ThemeData theme,
    SnackBarL10n l10n = const SnackBarL10n(),
    Color? backgroundColor,
    Color? textColor,
  }) {
    final colorScheme = theme.colorScheme;
    return _show(
      SnackBar(
        backgroundColor: backgroundColor ?? colorScheme.error,
        content: Text(
          l10n.localizeError(error),
          style: TextStyle(
            color: textColor ?? colorScheme.onError,
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _show(
    SnackBar snackBar,
  ) {
    removeCurrentSnackBar();
    return showSnackBar(snackBar);
  }
}

@immutable
class SnackBarL10n {
  const SnackBarL10n();
  String get undo => 'UNDO';
  String localizeError(dynamic error) => '$error';
}
