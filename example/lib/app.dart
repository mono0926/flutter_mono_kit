import 'package:flutter/material.dart' hide Router;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:nested/nested.dart';

import 'pages/pages.dart';
import 'router.dart';

class App extends HookWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'mono_kit Demo';
    return MaterialApp(
      title: title,
      home: const HomePage(title: title),
      builder: (context, child) => Nested(
        children: const [
          TextScaleFactor(),
        ],
        child: Barrier(
          child: child,
        ),
      ),
      theme: lightTheme(),
      darkTheme: darkTheme(),
      onGenerateRoute: useProvider(router).onGenerateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute<void>(
        settings: settings,
        builder: (context) => const NotFoundPage(),
      ),
    );
  }
}
