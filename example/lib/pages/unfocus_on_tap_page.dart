import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:quiver/iterables.dart';

class UnfocusOnTapRoute extends GoRouteData {
  const UnfocusOnTapRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const UnfocusOnTapPage();
}

class UnfocusOnTapPage extends StatelessWidget {
  const UnfocusOnTapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteName(
            GoRouterState.of(context).uri.toString().toString())),
      ),
      body: CenteredMaxWidth(
        width: 560,
        child: UnfocusOnTap(
          child: Column(
            children: range(0, 3)
                .map(
                  (_) => const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
