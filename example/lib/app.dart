import 'package:flutter/material.dart' hide Router;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:nested/nested.dart';

import 'router/router.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  static const title = 'mono_kit Demo';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: title,
      builder: (context, child) => Nested(
        children: const [
          TextScaleFactor(),
        ],
        child: Barrier(
          child: child!,
        ),
      ),
      theme: lightTheme(),
      darkTheme: darkTheme(),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
