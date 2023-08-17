import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

class MaxWidthPaddingBuilderRoute extends GoRouteData {
  const MaxWidthPaddingBuilderRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MaxWidthPaddingBuilderPage();
}

class MaxWidthPaddingBuilderPage extends StatelessWidget {
  const MaxWidthPaddingBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteUri(GoRouterState.of(context).uri)),
      ),
      body: MaxWidthPaddingBuilder(
        width: 300,
        builder: (context, padding) => ListView(
          padding: padding,
          children: List.filled(
            3,
            const Placeholder(),
          ),
        ),
      ),
    );
  }
}
