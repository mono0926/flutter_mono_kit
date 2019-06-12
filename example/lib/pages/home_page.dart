import 'package:example/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/utils/utils.dart';

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
            title: const Text('CFBundleDevelopmentRegion'),
            subtitle: FutureBuilder<String>(
              future:
                  IosInfoPlistReader().readString('CFBundleDevelopmentRegion'),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return null;
                }
                return Text(snap.data);
              },
            ),
          )
        ],
      ),
    );
  }
}
