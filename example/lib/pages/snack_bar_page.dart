import 'package:example/router/router.dart';
import 'package:example/util/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

class SnackBarRoute extends GoRouteData {
  const SnackBarRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SnackBarPage();
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteName(
            GoRouterState.of(context).uri.toString().toString())),
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
            onTap: () => messenger.showError(
              '(´・︵・｀)',
              theme: theme,
            ),
          ),
          ListTile(
            title: const Text('UNDO'),
            onTap: () => messenger.showUndo(
              'Dog 🐶',
              onUndo: () => logger.info('UNDO'),
              theme: theme,
            ),
          )
        ],
      ),
    );
  }
}
