import 'package:example/router.dart';
import 'package:example/util/util.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:mono_kit/plugins/plugins.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: [
          const WIP(
            child: ListTile(
              title: Text('Experimental Feature'),
            ),
            visible: true,
          ),
          ...PageInfo.all.map((info) {
            final routeName = info.routeName;
            return ListTile(
              title: Text(pascalCaseFromRouteName(routeName)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).pushNamed(routeName),
            );
          }),
          ListTile(
            title: const Text('iGhost(Dev) installed?'),
            subtitle: FutureBuilder(
              future: AppInstallationChecker()
                  .isInstalled('com.aquatica.ghost.dev'),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return const SizedBox();
                }
                return Text(snap.data.toString());
              },
            ),
          ),
          ListTile(
            title: const Text('showPhotoSelectionSheet()'),
            trailing: const Icon(Icons.photo_library),
            onTap: () {
              showPhotoSelectionSheet(
                context: context,
                onSettingAppOpenRequested: () {
                  logger.info('onSettingAppOpenRequested');
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
