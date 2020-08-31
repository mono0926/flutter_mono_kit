import 'package:flutter/material.dart' hide Router;
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';

import 'pages/pages.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'mono_kit Demo';
    return MaterialApp(
      title: title,
      home: const HomePage(title: title),
      builder: (context, child) => MultiProvider(
        providers: const [
          TextScaleFactor(),
        ],
        child: Barrier(
          child: child,
        ),
      ),
      theme: lightTheme(),
      darkTheme: darkTheme(),
      onGenerateRoute: context.watch<Router>().onGenerateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute<void>(
        settings: settings,
        builder: (context) => const NotFoundPage(),
      ),
    );
  }
}
