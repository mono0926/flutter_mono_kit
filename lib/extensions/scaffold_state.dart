import 'package:flutter/material.dart';

extension ScaffoldStateEx on ScaffoldState {
  void showSimpleSnackBar(String text) {
    this
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(text)),
      );
  }

  void showUndoSnackBar({
    @required String text,
    @required VoidCallback onUndo,
    SnackBarL10n l10n = const SnackBarL10n(),
  }) {
    this
      ..removeCurrentSnackBar()
      ..showSnackBar(
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

  void showNotImplementedSnackBar({SnackBarL10n l10n = const SnackBarL10n()}) {
    showErrorSnackBar(l10n.notImplemented);
  }

  void showErrorSnackBar(
    dynamic error, {
    SnackBarL10n l10n = const SnackBarL10n(),
  }) {
    this
      ..removeCurrentSnackBar()
      ..showSnackBar(
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
