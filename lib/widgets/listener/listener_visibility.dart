import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class const ListenerVisibility({
  super.key,
  required final ValueListenable<bool> visible,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: visible,
      builder: (context, visible, child) {
        return Visibility(
          visible: visible,
          child: child!,
        );
      },
      child: child,
    );
  }
}
