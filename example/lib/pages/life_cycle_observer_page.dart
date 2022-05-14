import 'dart:async';

import 'package:example/router/router.dart';
import 'package:example/util/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mono_kit/mono_kit.dart';

class LifeCycleObserverRoute extends GoRouteData {
  const LifeCycleObserverRoute();
  @override
  Widget build(BuildContext context) => const LifeCycleObserverPage();
}

class LifeCycleObserverPage extends ConsumerStatefulWidget {
  const LifeCycleObserverPage({Key? key}) : super(key: key);

  @override
  _LifeCycleObserverPageState createState() => _LifeCycleObserverPageState();
}

class _LifeCycleObserverPageState extends ConsumerState<LifeCycleObserverPage> {
  late final StreamSubscription<void> subscription;

  @override
  void initState() {
    super.initState();

    subscription = ref.read(lifecycleObserver.stream).listen(logger.info);
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteName(GoRouter.of(context).location)),
      ),
      body: const Center(
        child: Text(
          'Close and Open',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
