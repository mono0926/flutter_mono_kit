import 'dart:async';

import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:mono_kit/widgets/widgets.dart';

class BarrierRoute extends GoRouteData {
  const BarrierRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BarrierPage();
}

class BarrierPage extends ConsumerStatefulWidget {
  const BarrierPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BarrierPage> createState() => _BarrierPageState();
}

class _BarrierPageState extends ConsumerState<BarrierPage> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(pascalCaseFromRouteName(GoRouterState.of(context).location)),
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
