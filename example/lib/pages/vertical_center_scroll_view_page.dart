import 'package:example/router/router.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mono_kit/mono_kit.dart';

class const VerticalCenterScrollViewRoute()
    extends GoRouteData
    with $VerticalCenterScrollViewRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const VerticalCenterScrollViewPage();
}

class const VerticalCenterScrollViewPage({super.key}) extends StatelessWidget {
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
