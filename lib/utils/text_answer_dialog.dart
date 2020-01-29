import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

@immutable
class TextAnswerDialog {
  static Future<bool> show({
    @required BuildContext context,
    @required String title,
    @required String message,
    @required String keyword,
    @required String hintText,
    @required String okButtonLabel,
    @required String retryTitle,
    @required String retryMessage,
    @required String retryButtonLabel,
  }) async {
    final text = await showDialog<String>(
      context: context,
      builder: (context) => TextInputDialog(
        titleLabel: title,
        messageLabel: message,
        hintText: hintText,
        okButtonLabel: okButtonLabel,
      ),
    );
    final result = text == null
        ? _TextAnswerDialogResult.cancelled
        : text == keyword
            ? _TextAnswerDialogResult.correct
            : _TextAnswerDialogResult.incorrect;

    switch (result) {
      case _TextAnswerDialogResult.cancelled:
        return false;
      case _TextAnswerDialogResult.correct:
        return true;
      case _TextAnswerDialogResult.incorrect:
        final retry = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(retryTitle),
                  content: Text(retryMessage),
                  actions: [
                    FlatButton(
                      child: Text(
                          MaterialLocalizations.of(context).cancelButtonLabel),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    FlatButton(
                      child: Text(retryButtonLabel),
                      onPressed: () => Navigator.of(context).pop(true),
                    )
                  ],
                ));
        if (!retry) {
          return false;
        }
        return show(
          context: context,
          title: title,
          message: message,
          keyword: keyword,
          hintText: hintText,
          okButtonLabel: okButtonLabel,
          retryTitle: retryTitle,
          retryMessage: retryMessage,
          retryButtonLabel: retryButtonLabel,
        );
    }
    assert(false, 'invalid result: $result');
    return false;
  }
}

enum _TextAnswerDialogResult {
  cancelled,
  correct,
  incorrect,
}
