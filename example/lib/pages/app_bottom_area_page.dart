import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class AppBottomAreaPage extends StatelessWidget {
  const AppBottomAreaPage({Key key}) : super(key: key);

  static const routeName = '/app_bottom_area';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return AppBottomArea(
      bottom: Container(
        width: double.infinity,
        color: colorScheme.onSurface,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'AppBottomArea',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyText2.copyWith(
                color: colorScheme.surface,
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
            title: const Text(routeName),
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
            color: colorScheme.secondaryVariant,
            child: Text(
              'bottomNavigationBar',
              textAlign: TextAlign.center,
              style: theme.primaryTextTheme.bodyText2,
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
