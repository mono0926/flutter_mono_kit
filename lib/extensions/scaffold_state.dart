import 'package:flutter/material.dart';

extension ScaffoldStateEx on ScaffoldState {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSimpleSnackBar(
    String text,
  ) {
    removeCurrentSnackBar();
    return showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showUndoSnackBar({
    @required String text,
    @required VoidCallback onUndo,
    SnackBarL10n l10n = const SnackBarL10n(),
  }) {
    removeCurrentSnackBar();
    return showSnackBar(
      SnackBar(
        content: Text(text),
        action: SnackBarAction(
          textColor: Theme.of(context).textSelectionColor,
          label: l10n.undo,
          onPressed: onUndo,
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showNotImplementedSnackBar({
    SnackBarL10n l10n = const SnackBarL10n(),
  }) {
    return showErrorSnackBar(l10n.notImplemented);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(
    dynamic error, {
    SnackBarL10n l10n = const SnackBarL10n(),
  }) {
    removeCurrentSnackBar();
    return showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).errorColor,
        content: Text(
          l10n.localizeError(error),
        ),
      ),
    );
  }
}

@immutable
class SnackBarL10n {
  const SnackBarL10n();
  String get undo => '元に戻す';
  String get notImplemented => '未実装です';
  String localizeError(dynamic error) => '$error';
}
