import 'package:example/util/util.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key key}) : super(key: key);

  static const routeName = '/snack_bar';

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(SnackBarPage.routeName),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Plain Text'),
            onTap: () => messenger.showMessage('(　´･‿･｀)'),
          ),
          ListTile(
            title: Text(
              'Error',
              style: TextStyle(
                color: colorScheme.error,
              ),
            ),
            onTap: () => messenger.showError('(´・︵・｀)'),
          ),
          ListTile(
            title: const Text('UNDO'),
            onTap: () => messenger.showUndo(
              '🐶',
              onUndo: () => logger.info('UNDO'),
            ),
          )
        ],
      ),
    );
  }
}
