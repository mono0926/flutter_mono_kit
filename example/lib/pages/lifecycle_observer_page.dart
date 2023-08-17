import 'package:example/router/router.dart';
import 'package:example/util/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono_kit/mono_kit.dart';

class LifecycleObserverRoute extends GoRouteData {
  const LifecycleObserverRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LifecycleObserverPage();
}

class LifecycleObserverPage extends ConsumerWidget {
  const LifecycleObserverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<AppLifecycleState>>(lifecycleObserver, (_, state) {
      logger.info(state.value);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteUri(GoRouterState.of(context).uri)),
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
