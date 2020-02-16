import 'package:flutter/material.dart';

extension ScaffoldStateEx on ScaffoldState {
  void show(String text) {
    this
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(text)),
      );
  }

  void showUndo({
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

  void notImplemented({SnackBarL10n l10n = const SnackBarL10n()}) {
    showError(l10n.notImplemented);
  }

  void showError(
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
