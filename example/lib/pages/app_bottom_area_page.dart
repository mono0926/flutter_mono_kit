import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

class AppBottomAreaRoute extends GoRouteData {
  const AppBottomAreaRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AppBottomAreaPage();
}

class AppBottomAreaPage extends StatelessWidget {
  const AppBottomAreaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return AppBottomArea(
      bottom: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'AppBottomArea',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      child: DebugPadding(
//        showPadding: false,
//        showViewPadding: false,
//      showViewInsets: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(pascalCaseFromRouteUri(GoRouterState.of(context).uri)),
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
      ),
    );
  }
}
