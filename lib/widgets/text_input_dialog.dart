import 'package:flutter/material.dart';

class TextInputDialog extends StatefulWidget {
  const TextInputDialog({
    Key key,
    @required this.titleLabel,
    @required this.okLabel,
    @required this.onOkPressed,
    this.initialText,
  }) : super(key: key);

  final String titleLabel;
  final String okLabel;
  final void Function(String text) onOkPressed;
  final String initialText;

  @override
  _TextInputDialogState createState() => _TextInputDialogState();
}

class _TextInputDialogState extends State<TextInputDialog> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _textEditingController.text = widget.initialText;
  }

  @override
  void dispose() {
    _textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.titleLabel),
      content: TextField(
        autofocus: true,
        controller: _textEditingController,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text(widget.okLabel),
          onPressed: () {
            widget.onOkPressed(_textEditingController.text);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
