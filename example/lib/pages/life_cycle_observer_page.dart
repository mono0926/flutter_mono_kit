import 'dart:async';

import 'package:example/util/util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mono_kit/mono_kit.dart';

class LifeCycleObserverPage extends ConsumerStatefulWidget {
  const LifeCycleObserverPage({Key? key}) : super(key: key);

  static const routeName = '/life_cycle_observer';

  @override
  _LifeCycleObserverPageState createState() => _LifeCycleObserverPageState();
}

class _LifeCycleObserverPageState extends ConsumerState<LifeCycleObserverPage> {
  late final StreamSubscription<void> subscription;

  @override
  void initState() {
    super.initState();

    subscription = ref.read(lifecycleObserver).stateStream.listen(logger.info);
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
