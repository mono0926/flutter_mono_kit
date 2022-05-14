import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

class ListTileSelectedBackgroundColoredBoxRoute extends GoRouteData {
  const ListTileSelectedBackgroundColoredBoxRoute();
  @override
  Widget build(BuildContext context) =>
      const ListTileSelectedBackgroundColoredBoxPage();
}

class ListTileSelectedBackgroundColoredBoxPage extends StatefulWidget {
  const ListTileSelectedBackgroundColoredBoxPage({Key? key}) : super(key: key);

  @override
  _ListTileSelectedBackgroundColoredBoxPageState createState() =>
      _ListTileSelectedBackgroundColoredBoxPageState();
}

class _ListTileSelectedBackgroundColoredBoxPageState
    extends State<ListTileSelectedBackgroundColoredBoxPage> {
  static const _listTileTexts = [
    'Hello',
    'Animals',
    'Dog',
    'Cat',
  ];

  var _selectedText = _listTileTexts.first;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteName(GoRouter.of(context).location)),
      ),
      body: Center(
        child: FilledTonalButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('BACK'),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: colorScheme.primary,
              ),
              child: Text(
                'Header',
                style: theme.primaryTextTheme.headline4,
              ),
            ),
            ..._listTileTexts.map(
              (text) => ListTileSelectedBackgroundColoredBox(
                listTile: ListTile(
                  title: Text(text),
                  selected: _selectedText == text,
                  onTap: () {
                    setState(() {
                      _selectedText = text;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
