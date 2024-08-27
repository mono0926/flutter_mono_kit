import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef DelayedPopInvokedWithResultCallback<T> = Future<bool> Function(
  T? result,
);

class DelayedPopScope<T> extends StatelessWidget {
  const DelayedPopScope({
    super.key,
    required this.onShouldPop,
    required this.child,
    this.canPop = false,
  });

  final DelayedPopInvokedWithResultCallback<T> onShouldPop;
  final bool canPop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope<T>(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        final navigator = Navigator.of(context);
        final shouldPop = await onShouldPop(result);
        if (shouldPop) {
          if (navigator.canPop()) {
            navigator.pop();
          } else {
            await SystemNavigator.pop();
          }
        }
      },
      child: child,
    );
  }
}
