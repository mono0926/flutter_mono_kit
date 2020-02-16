import 'package:flutter/material.dart';

Future<T> showConfirmDialog<T>({
  @required BuildContext context,
  @required String title,
  @required String message,
  @required List<DialogAction<T>> actions,
}) {
  return showDialog<T>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: actions
          .map(
            (a) => FlatButton(
              child: Text(a.label),
              onPressed: () {
                Navigator.of(context).pop<T>(a.key);
              },
            ),
          )
          .toList(),
    ),
  );
}

Future<void> showOkDialog({
  @required BuildContext context,
  @required String title,
  @required String message,
  String okLabel,
}) {
  return showConfirmDialog<void>(
    context: context,
    title: title,
    message: message,
    actions: [
      DialogAction<dynamic>(
        label: okLabel ?? MaterialLocalizations.of(context).okButtonLabel,
      )
    ],
  );
}

@immutable
class DialogAction<T> {
  const DialogAction({
    @required this.label,
    this.key,
  });

  final T key;
  final String label;
}
