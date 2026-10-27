import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

Widget goRouteLocationButtonNavigationBuilder(
  BuildContext context,
  GoRouterState state,
  Widget child, {
  bool visible = kDebugMode,
}) => GoRouterLocationButton(
  visible: visible,
  child: child,
);

class const GoRouterLocationButton({
  super.key,
  required final Widget child,
  final bool visible = true,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return child;
    }
    final router = GoRouter.of(context);
    final routerState = GoRouterState.of(context);
    final location = routerState.uri.toString();
    return Stack(
      children: [
        child,
        Positioned(
          right: 0,
          bottom: 0,
          child: SafeArea(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () async {
                final next = (await showTextInputDialog(
                  context: context,
                  textFields: [
                    DialogTextField(initialText: location),
                  ],
                ))?.first;
                if (next != null) {
                  router.go(next);
                }
              },
              child: Text(location),
            ),
          ),
        ),
      ],
    );
  }
}
