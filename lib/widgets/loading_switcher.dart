import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class LoadingSwitcher extends StatelessWidget {
  const LoadingSwitcher({
    Key key,
    @required this.timedOutChild,
    this.child,
    this.initialChild = const SizedBox(),
    this.timeout = const Duration(milliseconds: 200),
    this.switchDuration = const Duration(milliseconds: 100),
  })  : assert(timedOutChild != null),
        assert(initialChild != null),
        assert(timeout != null),
        super(key: key);

  final Widget timedOutChild;
  final Widget initialChild;
  final Widget child;
  final Duration timeout;
  final Duration switchDuration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: switchDuration,
      child: child ??
          TimeoutSwitcher(
            timedOutChild: timedOutChild,
            initialChild: initialChild,
            timeout: timeout,
            switchDuration: switchDuration,
          ),
    );
  }
}
