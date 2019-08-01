import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

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
      theme: _buildTheme(),
      home: const HomePage(title: title),
      onGenerateRoute: _router.handle,
      onUnknownRoute: (settings) => MaterialPageRoute<void>(
        settings: settings,
        builder: (context) => const NotFoundPage(),
      ),
      navigatorObservers: [RouteObserverProvider.of(context)],
    );
  }

  ThemeData _buildTheme() {
    final base = ThemeData.light();
    const accentColor = Color(0xFF007AFF);
    const buttonColor = Color(0xFFF0F0F7);
    final highlightColor = accentColor.withOpacity(0.04);
    return base.copyWith(
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: accentColor,
      ),
      primaryColor: Colors.white,
      accentColor: accentColor,
      buttonColor: accentColor,
      scaffoldBackgroundColor: Colors.white,
      highlightColor: highlightColor,
//      splashColor: splashColor,
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: base.primaryTextTheme.apply(
        bodyColor: Colors.black87,
      ),
      appBarTheme: base.appBarTheme.copyWith(
        elevation: 1,
      ),
      dividerColor: Colors.black26,
      textTheme: base.textTheme.copyWith(
        body1: base.textTheme.body1.copyWith(fontSize: 13),
        button: base.textTheme.button.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: buttonColor,
        highlightColor: highlightColor,
        colorScheme: base.buttonTheme.colorScheme.copyWith(
          secondary: accentColor,
          primary: accentColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        minWidth: 44,
        height: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 7,
        ),
      ),
      primaryIconTheme: base.primaryIconTheme.copyWith(
        color: accentColor,
      ),
    );
  }
}
