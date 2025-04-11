import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:example/app.dart';
import 'package:example/router/router.dart';
import 'package:example/util/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:mono_kit/plugins/plugins.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(App.title)),
      body: ListView(
        children: [
          const WIP(
            visible: true,
            child: ListTile(title: Text('Experimental Feature')),
          ),
          ...allRouteLocations.map((location) {
            return ListTile(
              title: Text(pascalCaseFromRouteName(location)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go(location),
            );
          }),
          ListTile(
            title: const Text('iGhost(Dev) installed?'),
            subtitle: FutureBuilder(
              future: AppInstallationChecker().isInstalled(
                'com.aquatica.ghost.dev',
              ),
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
                additionalActions: (
                  [
                    const SheetAction(
                      label: 'Custom Action',
                      icon: Icons.warning,
                      key: 'custom_key',
                    ),
                  ],
                  (key) {
                    logger.info('Additional action selected: $key');
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

enum Hoge { a }
