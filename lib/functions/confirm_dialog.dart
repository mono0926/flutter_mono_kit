import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

// TODO(mono): Destructive対応
Future<T> showConfirmDialog<T>({
  @required BuildContext context,
  @required String title,
  @required String message,
  @required List<DialogAction<T>> actions,
}) {
  void pop(T key) => Navigator.of(context).pop(key);
  return isCupertinoStyle
      ? showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: actions
                .map(
                  (a) => CupertinoButton(
                    child: Text(a.label),
                    onPressed: () => pop(a.key),
                  ),
                )
                .toList(),
          ),
        )
      : showDialog<T>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: actions
                .map(
                  (a) => FlatButton(
                    child: Text(a.label),
                    onPressed: () => pop(a.key),
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
