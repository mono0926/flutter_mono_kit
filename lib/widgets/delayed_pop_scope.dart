import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:nested/nested.dart';

typedef DelayedPopInvokedWithResultCallback<T> = Future<bool> Function(
  T? result,
);

class const DelayedPopScope<T>({
  super.key,
  required final DelayedPopInvokedWithResultCallback<T> onShouldPop,
  super.child,
  final bool canPop = false,
  final PopInvokedWithResultCallback<T>? onPopInvokedWithResult,
}) extends SingleChildStatelessWidget {
  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return PopScope<T>(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) async {
        onPopInvokedWithResult?.call(didPop, result);
        if (didPop) {
          return;
        }
        final navigator = Navigator.of(context);
        final shouldPop = await onShouldPop(result);
        if (shouldPop) {
          if (navigator.canPop()) {
            navigator.pop(result);
          } else {
            await SystemNavigator.pop();
          }
        }
      },
      child: child!,
    );
  }
}
