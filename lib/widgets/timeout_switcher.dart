import 'dart:async';

import 'package:material_ui/material_ui.dart';

class const TimeoutSwitcher({
  super.key,
  required final Widget timedOutChild,
  final Widget initialChild = const SizedBox(),
  final Duration timeout = const Duration(milliseconds: 200),
  final Duration switchDuration = const Duration(milliseconds: 100),
}) extends StatefulWidget {
  @override
  State<TimeoutSwitcher> createState() => _TimeoutSwitcherState();
}

class _TimeoutSwitcherState() extends State<TimeoutSwitcher> {
  var _timedOut = false;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(
      widget.timeout,
      () {
        if (mounted) {
          setState(
            () => _timedOut = true,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.switchDuration,
      child: _timedOut ? widget.timedOutChild : widget.initialChild,
    );
  }
}
