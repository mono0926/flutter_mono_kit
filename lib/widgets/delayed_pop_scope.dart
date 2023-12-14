import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DelayedPopScope extends StatelessWidget {
  const DelayedPopScope({
    super.key,
    required this.onShouldPop,
    required this.child,
    this.canPop = false,
  });

  final AsyncValueGetter<bool> onShouldPop;
  final bool canPop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        final navigator = Navigator.of(context);
        final shouldPop = await onShouldPop();
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
