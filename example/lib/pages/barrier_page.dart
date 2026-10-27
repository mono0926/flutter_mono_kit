import 'dart:async';

import 'package:example/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:mono_kit/widgets/widgets.dart';

class const BarrierRoute() extends GoRouteData with $BarrierRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BarrierPage();
}

class const BarrierPage({super.key}) extends ConsumerStatefulWidget {
  @override
  ConsumerState<BarrierPage> createState() => _BarrierPageState();
}

class _BarrierPageState() extends ConsumerState<BarrierPage> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteUri(GoRouterState.of(context).uri)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // このブロックで囲まれている処理が終わるまでプログレス表示
          ref.read(barrierProvider.notifier).executeWithProgress(() async {
            // ダミー処理時間として1秒待つ
            await Future<void>.delayed(const Duration(seconds: 1));
            setState(() => _count++);
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          '$_count',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
