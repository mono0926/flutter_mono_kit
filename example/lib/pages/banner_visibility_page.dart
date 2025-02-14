import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

class BannerVisibilityRoute extends GoRouteData {
  const BannerVisibilityRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BannerVisibilityPage();
}

class BannerVisibilityPage extends StatefulWidget {
  const BannerVisibilityPage({super.key});

  @override
  State<BannerVisibilityPage> createState() => _BannerVisibilityPageState();
}

class _BannerVisibilityPageState extends State<BannerVisibilityPage> {
  final _isVisible = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteUri(GoRouterState.of(context).uri)),
      ),
      body: Column(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: _isVisible,
            builder: (context, isVisible, child) {
              return AnimatedExpansionVisibility(
                isVisible: isVisible,
                curve: Curves.ease,
                child: child,
              );
            },
            child: MaterialBanner(
              content: const Text('This is a banner. Dismiss me'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => _isVisible.value = false,
                  child: const Text('DISMISS'),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            alignment: Alignment.center,
            color: Colors.blue,
            child: const Text('A Container'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _isVisible.value = !_isVisible.value,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
