import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:example/router/router.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mono_kit/mono_kit.dart';

class const DelayedPopScopeRoute()
    extends GoRouteData
    with $DelayedPopScopeRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DelayedPopScopePage();
}

class const DelayedPopScopePage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DelayedPopScope(
      onShouldPop: (result) async {
        final confirmationResult = await showOkCancelAlertDialog(
          context: context,
          message: '前のページに戻りますか？',
          okLabel: '戻る',
          cancelLabel: '戻らないでとどまる',
        );
        return confirmationResult == OkCancelResult.ok;
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
                // ignore: lines_longer_than_80_chars
                'AppBarの戻るボタン、あるいは下のボタンで`maybePop`実行すると、DelayedPopScopeが呼ばれて確認ダイアログが表示されます。',
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                child: const Text('maybePop()'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
