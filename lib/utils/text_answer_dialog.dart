import 'package:flutter/material.dart';

@immutable
class TextAnswerDialog {
  static void show({
    @required BuildContext context,
    @required String title,
    @required String message,
    @required String keyword,
    @required String hintText,
    @required String okButtonLabel,
    @required String retryTitle,
    @required String retryMessage,
    @required String retryButtonLabel,
    @required OnCompleted onCompleted,
  }) async {
    final result = await showDialog<TextAnswerDialogResult>(
      context: context,
      builder: (context) => _Dialog(
        title: title,
        message: message,
        keyword: keyword,
        hintText: hintText,
        okButtonLabel: okButtonLabel,
        onCompleted: onCompleted,
      ),
    );

    switch (result) {
      case TextAnswerDialogResult.cancelled:
        onCompleted(false);
        break;
      case TextAnswerDialogResult.incorrect:
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
        if (retry) {
          show(
            context: context,
            title: title,
            message: message,
            keyword: keyword,
            hintText: hintText,
            okButtonLabel: okButtonLabel,
            retryTitle: retryTitle,
            retryMessage: retryMessage,
            retryButtonLabel: retryButtonLabel,
            onCompleted: onCompleted,
          );
        } else {
          onCompleted(false);
        }
        break;
      case TextAnswerDialogResult.correct:
        onCompleted(true);
        break;
    }
  }
}

typedef OnCompleted = Function(bool result);

enum TextAnswerDialogResult {
  cancelled,
  correct,
  incorrect,
}

class _Dialog extends StatefulWidget {
  const _Dialog({
    @required this.title,
    @required this.message,
    @required this.keyword,
    @required this.hintText,
    @required this.okButtonLabel,
    @required this.onCompleted,
  });
  @override
  _DialogState createState() => _DialogState();

  final String title;
  final String message;
  final String keyword;
  final String hintText;
  final String okButtonLabel;
  final OnCompleted onCompleted;
}

class _DialogState extends State<_Dialog> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              color: Theme.of(context).inputDecorationTheme.fillColor,
              child: Scrollbar(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8),
                  child: Text(widget.message),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Theme(
            data: Theme.of(context)
                .copyWith(primaryColor: Theme.of(context).accentColor),
            child: TextField(
              controller: _textController,
              autofocus: true,
              decoration: InputDecoration(hintText: widget.hintText),
            ),
          ),
        ],
      ),
      actions: [
        FlatButton(
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          onPressed: () =>
              Navigator.of(context).pop(TextAnswerDialogResult.cancelled),
        ),
        FlatButton(
          child: Text(widget.okButtonLabel),
          onPressed: () {
            Navigator.of(context).pop(_textController.text == widget.keyword
                ? TextAnswerDialogResult.correct
                : TextAnswerDialogResult.incorrect);
          },
        )
      ],
    );
  }
}
