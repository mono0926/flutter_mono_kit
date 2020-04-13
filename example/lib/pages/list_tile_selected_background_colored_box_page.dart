import 'package:example/router.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class ListTileSelectedBackgroundColoredBoxPage extends StatefulWidget {
  const ListTileSelectedBackgroundColoredBoxPage({Key key}) : super(key: key);

  static const routeName = '/list_tile_selected_background_colored_box';

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
        title: Text(
          pascalCaseFromRouteName(
              ListTileSelectedBackgroundColoredBoxPage.routeName),
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('BACK'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Header',
                style: theme.primaryTextTheme.headline4,
              ),
              decoration: BoxDecoration(
                color: colorScheme.primary,
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
