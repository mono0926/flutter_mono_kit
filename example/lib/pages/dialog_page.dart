import 'package:example/router.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key key}) : super(key: key);

  static const routeName = '/dialog';

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteName(DialogPage.routeName)),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('OK Dialog'),
            onTap: () => showOkDialog(
              context: context,
              title: 'Title',
              message: 'This is message.',
            ),
          ),
          ListTile(
            title: const Text('OK Dialog (Custom okLabel'),
            onTap: () => showOkDialog(
              context: context,
              title: 'Title',
              message: 'This is message.',
              okLabel: 'YES!',
            ),
          ),
        ],
      ),
    );
  }
}
