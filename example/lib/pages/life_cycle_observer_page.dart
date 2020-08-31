import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mono_kit/mono_kit.dart';

class LifeCycleObserverPage extends StatefulWidget {
  const LifeCycleObserverPage({Key key}) : super(key: key);

  static const routeName = '/life_cycle_observer';

  @override
  _LifeCycleObserverPageState createState() => _LifeCycleObserverPageState();
}

class _LifeCycleObserverPageState extends State<LifeCycleObserverPage> {
  StreamSubscription subscription;

  @override
  void initState() {
    super.initState();

    subscription = context.read(lifecycleObserver).stateStream.listen(print);
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
