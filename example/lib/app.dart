import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          // MaterialApp配下の任意のWidgetで `context.read<BarrierController>()`
          // 経由で全画面プログレス表示のコントロールをできるようにするためにここで包む
          // 以下2つを合わせた `BarrierKit()` もある
          BarrierControllerProvider(),
          Barrier(),
        ],
        child: child,
      ),
      theme: ThemeData.light(),
      darkTheme: ThemeData.from(colorScheme: const ColorScheme.dark()),
      onGenerateRoute: context.watch<Router>().onGenerateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute<void>(
        settings: settings,
        builder: (context) => const NotFoundPage(),
      ),
    );
  }
}
