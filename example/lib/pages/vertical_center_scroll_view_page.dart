import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

class VerticalCenterScrollViewRoute extends GoRouteData {
  const VerticalCenterScrollViewRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const VerticalCenterScrollViewPage();
}

class VerticalCenterScrollViewPage extends StatelessWidget {
  const VerticalCenterScrollViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteUri(GoRouterState.of(context).uri)),
      ),
      body: const VerticalCenterScrollView(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: UnfocusOnTap(
          child: Text('Vertical Center Scroll View'),
        ),
      ),
    );
  }
}
