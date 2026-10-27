import 'package:example/router/router.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mono_kit/mono_kit.dart';

class const BetterPlaceholderRoute()
    extends GoRouteData
    with $BetterPlaceholderRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BetterPlaceholderPage();
}

class const BetterPlaceholderPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteUri(GoRouterState.of(context).uri)),
      ),
      body: ListView(
        children: const [
          BetterPlaceholder(),
          BetterPlaceholder(
            fallbackWidth: 100,
            fallbackHeight: 200,
          ),
          BetterPlaceholder(
            fallbackHeight: 30,
          ),
        ],
      ),
    );
  }
}
