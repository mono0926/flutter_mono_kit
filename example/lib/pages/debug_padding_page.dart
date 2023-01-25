import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

class DebugPaddingRoute extends GoRouteData {
  const DebugPaddingRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DebugPaddingPage();
}

class DebugPaddingPage extends StatelessWidget {
  const DebugPaddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return DebugPadding(
//      showPadding: false,
//      showViewPadding: false,
//      showViewInsets: false,
//      showSize: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(pascalCaseFromRouteName(GoRouter.of(context).location)),
        ),
        body: UnfocusOnTap(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 48),
            children: List.filled(
              10,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        bottomNavigationBar: BottomAppBar(
          color: colorScheme.secondaryContainer,
          child: Text(
            'bottomNavigationBar',
            textAlign: TextAlign.center,
            style: theme.primaryTextTheme.bodyMedium,
          ),
        ),
        bottomSheet: Container(
          width: double.infinity,
          color: colorScheme.secondary,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: const Text(
            'bottomSheet',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
