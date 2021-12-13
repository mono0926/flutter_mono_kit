import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:mono_kit/widgets/widgets.dart';

class BarrierPage extends ConsumerStatefulWidget {
  const BarrierPage({Key? key}) : super(key: key);

  static const routeName = '/barrier';

  @override
  _BarrierPageState createState() => _BarrierPageState();
}

class _BarrierPageState extends ConsumerState<BarrierPage> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(BarrierPage.routeName),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // このブロックで囲まれている処理が終わるまでプログレス表示
          ref.read(barrierProvider.notifier).executeWithProgress(() async {
            // ダミー処理時間として1秒待つ
            await Future<void>.delayed(const Duration(seconds: 5));
            setState(() => _count++);
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          '$_count',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
