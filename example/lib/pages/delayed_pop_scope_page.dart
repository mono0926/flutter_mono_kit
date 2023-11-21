import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

class DelayedPopScopeRoute extends GoRouteData {
  const DelayedPopScopeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DelayedPopScopePage();
}

class DelayedPopScopePage extends StatelessWidget {
  const DelayedPopScopePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DelayedPopScope(
      onShouldPop: () async {
        final result = await showOkCancelAlertDialog(
          context: context,
          message: '前のページに戻りますか？',
          okLabel: '戻る',
          cancelLabel: '戻らないでとどまる',
        );
        return result == OkCancelResult.ok;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(pascalCaseFromRouteUri(GoRouterState.of(context).uri)),
        ),
        body: CenteredMaxWidth(
          width: 320,
          child: ListView(
            children: [
              const Text(
                'AppBarの戻るボタン、あるいは下のボタンで`maybePop`実行すると、DelayedPopScopeが呼ばれて確認ダイアログが表示されます。',
              ),
              const SizedBox(height: 16),
              FilledButton(
                  onPressed: () {
                    Navigator.of(context).maybePop();
                  },
                  child: const Text('maybePop()'))
            ],
          ),
        ),
      ),
    );
  }
}
