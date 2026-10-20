import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';

typedef DelayedPopInvokedWithResultCallback<T> =
    Future<bool> Function(
      T? result,
    );

class DelayedPopScope<T> extends SingleChildStatelessWidget {
  const DelayedPopScope({
    super.key,
    required this.onShouldPop,
    super.child,
    this.canPop = false,
    this.onPopInvokedWithResult,
  });

  final DelayedPopInvokedWithResultCallback<T> onShouldPop;
  final bool canPop;
  final PopInvokedWithResultCallback<T>? onPopInvokedWithResult;

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
