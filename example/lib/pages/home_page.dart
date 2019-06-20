import 'package:example/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/plugins/plugins.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: [
          ListTile(
            title: const Text('OverflowDetectableText'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(OverflowDetectableTextPage.routeName);
            },
          ),
          ListTile(
            title: const Text('iGhost(Dev) installed?'),
            subtitle: FutureBuilder<bool>(
              future: AppInstallationChecker()
                  .isInstalled('com.aquatica.ghost.dev'),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return const SizedBox();
                }
                return Text(snap.data.toString());
              },
            ),
          )
        ],
      ),
    );
  }
}