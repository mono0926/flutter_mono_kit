import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

class FilledButtonRoute extends GoRouteData {
  const FilledButtonRoute();
  @override
  Widget build(BuildContext context) => const FilledButtonPage();
}

class FilledButtonPage extends ConsumerWidget {
  const FilledButtonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteName(GoRouter.of(context).location)),
      ),
      body: ListView(
        children: [
          ListSection(
            hasTopBorder: false,
            label: 'Filled Button',
            children: [
              Center(
                child: FilledButton(
                  child: const Text('Filled Button'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          ListSection(
            hasTopBorder: false,
            label: 'Filled Tonal Button',
            children: [
              Center(
                child: FilledTonalButton(
                  child: const Text('Filled Tonal Button'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
