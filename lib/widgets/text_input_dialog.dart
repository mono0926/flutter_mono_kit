import 'package:flutter/material.dart';

class TextInputDialog extends StatefulWidget {
  const TextInputDialog({
    @required this.titleLabel,
    @required this.okButtonLabel,
    this.messageLabel,
    this.hintText,
    this.initialText,
  });
  @override
  _TextInputDialogState createState() => _TextInputDialogState();

  final String titleLabel;
  final String okButtonLabel;
  final String messageLabel;
  final String hintText;
  final String initialText;
}

class _TextInputDialogState extends State<TextInputDialog> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _textController.text = widget.initialText;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.titleLabel),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.messageLabel != null)
            Flexible(
              child: Container(
                color: Theme.of(context).inputDecorationTheme.fillColor,
                padding: const EdgeInsets.only(bottom: 8),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8),
                    child: Text(widget.messageLabel),
                  ),
                ),
              ),
            ),
          TextField(
            controller: _textController,
            autofocus: true,
            decoration: InputDecoration(hintText: widget.hintText),
          ),
        ],
      ),
      actions: [
        FlatButton(
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          onPressed: () => Navigator.of(context).pop(null),
        ),
        FlatButton(
          child: Text(widget.okButtonLabel),
          onPressed: () => Navigator.of(context).pop(_textController.text),
        )
      ],
    );
  }
}
