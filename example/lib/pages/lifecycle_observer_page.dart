import 'package:example/router/router.dart';
import 'package:example/util/util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mono_kit/mono_kit.dart';

class const LifecycleObserverRoute()
    extends GoRouteData
    with $LifecycleObserverRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LifecycleObserverPage();
}

class const LifecycleObserverPage({super.key}) extends ConsumerWidget {
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
