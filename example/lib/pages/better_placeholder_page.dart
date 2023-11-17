import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

class BetterPlaceholderRoute extends GoRouteData {
  const BetterPlaceholderRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BetterPlaceholderPage();
}

class BetterPlaceholderPage extends StatelessWidget {
  const BetterPlaceholderPage({super.key});

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
