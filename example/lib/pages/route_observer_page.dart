import 'package:example/util/util.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class RouteObserverPage extends StatefulWidget {
  const RouteObserverPage({Key key}) : super(key: key);
  static const routeName = '/RouteObserver';

  @override
  _RouteObserverPageState createState() => _RouteObserverPageState();
}

class _RouteObserverPageState extends State<RouteObserverPage>
    with RouteAware, RouteObserverMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(RouteObserverPage.routeName),
      ),
      body: Center(
        child: RaisedButton(
          child: const Text('Next Page'),
          onPressed: () => Navigator.of(context).push<void>(
            MaterialPageRoute(
              builder: (context) => const _NextPage(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didPopNext() => logger.fine('didPopNext');

  @override
  void didPush() => logger.fine('didPush');

  @override
  void didPop() => logger.fine('didPop');

  @override
  void didPushNext() => logger.fine('didPushNext');
}

class _NextPage extends StatelessWidget {
  const _NextPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: const Text('Next page'),
      ),
    );
  }
}
