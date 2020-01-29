import 'package:example/util/util.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class TextInputDialogPage extends StatelessWidget {
  const TextInputDialogPage({Key key}) : super(key: key);

  static const routeName = '/text_input_dialog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(routeName),
      ),
      body: Center(
        child: RaisedButton(
          child: const Text('Open Dialog'),
          onPressed: () async {
            final text = await showDialog<String>(
              context: context,
              builder: (context) => const TextInputDialog(
                titleLabel: 'Hello',
                okButtonLabel: 'OK',
                initialText: 'World',
              ),
            );
            logger.info(text);
          },
        ),
      ),
    );
  }
}
