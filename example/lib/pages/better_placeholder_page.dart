import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

class BetterPlaceholderRoute extends GoRouteData {
  const BetterPlaceholderRoute();
  @override
  Widget build(BuildContext context) => const BetterPlaceholderPage();
}

class BetterPlaceholderPage extends StatelessWidget {
  const BetterPlaceholderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteName(GoRouter.of(context).location)),
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
