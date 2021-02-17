import 'package:flutter/material.dart';

class HUD {
  BuildContext? hudContext;
  void show(BuildContext context) {
    showGeneralDialog<void>(
      context: context,
      pageBuilder: (hudContext, _a, _sa) {
        this.hudContext = hudContext;
        return const Center(child: CircularProgressIndicator());
      },
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black26,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: (_c, animation, _sa, child) => FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ),
        child: child,
      ),
    );
  }

  void dismiss() {
    if (hudContext == null) {
      assert(false, 'hudContext should not be null.');
      return;
    }
    Navigator.of(hudContext!).pop();
  }
}
