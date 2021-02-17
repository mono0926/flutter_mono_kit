import 'package:flutter/material.dart';

void showErrorDialog({
  required BuildContext context,
  @required dynamic error,
  ErrorDialogL10n l10n = const ErrorDialogL10n(),
}) {
  showDialog<dynamic>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        l10n.errorTitle,
        style: TextStyle(
          color: Theme.of(context).errorColor,
        ),
      ),
      content: Text(
        l10n.localizeError(error),
      ),
      actions: [
        ElevatedButton(
          child: Text(MaterialLocalizations.of(context).okButtonLabel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    ),
  );
}

@immutable
class ErrorDialogL10n {
  const ErrorDialogL10n();
  String get errorTitle => 'エラーが発生しました';
  String localizeError(dynamic error) => '$error';
}
