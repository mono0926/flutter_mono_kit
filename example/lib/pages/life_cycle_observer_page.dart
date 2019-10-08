import 'dart:async';

import 'package:disposable_provider/disposable_provider.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';

class LifeCycleObserverPage extends StatefulWidget {
  const LifeCycleObserverPage._({Key key}) : super(key: key);

  static const routeName = '/life_cycle_observer';

  static Widget wrapped() {
    // 実際にはMaterialAppの上に置くイメージ
    return DisposableProvider(
      builder: (context) => LifeCycleObserver(),
      child: const LifeCycleObserverPage._(),
    );
  }

  @override
  _LifeCycleObserverPageState createState() => _LifeCycleObserverPageState();
}

class _LifeCycleObserverPageState extends State<LifeCycleObserverPage> {
  StreamSubscription subscription;

  @override
  void initState() {
    super.initState();

    subscription = Provider.of<LifeCycleObserver>(context, listen: false)
        .stateStream
        .listen(print);
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(LifeCycleObserverPage.routeName)),
      body: const Center(
        child: Text(
          'Close and Open',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
