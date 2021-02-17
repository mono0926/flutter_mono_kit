import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ListenerVisibility extends StatelessWidget {
  const ListenerVisibility({
    Key? key,
    required this.visible,
    required this.child,
  }) : super(key: key);

  final ValueListenable<bool> visible;
  final Widget child;

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
