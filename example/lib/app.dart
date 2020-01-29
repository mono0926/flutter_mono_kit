import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/pages.dart';
import 'router.dart';

class App extends StatelessWidget {
  App();

  final _router = Router();

  @override
  Widget build(BuildContext context) {
    const title = 'mono_kit Demo';
    return MaterialApp(
      title: title,
      home: const HomePage(title: title),
      onGenerateRoute: _router.handle,
      onUnknownRoute: (settings) => MaterialPageRoute<void>(
        settings: settings,
        builder: (context) => const NotFoundPage(),
      ),
    );
  }
}
