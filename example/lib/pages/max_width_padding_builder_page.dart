import 'package:example/router/router.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mono_kit/mono_kit.dart';

class const MaxWidthPaddingBuilderRoute()
    extends GoRouteData
    with $MaxWidthPaddingBuilderRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MaxWidthPaddingBuilderPage();
}

class const MaxWidthPaddingBuilderPage({super.key}) extends StatelessWidget {
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
