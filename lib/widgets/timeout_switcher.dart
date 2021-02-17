import 'dart:async';

import 'package:flutter/material.dart';

class TimeoutSwitcher extends StatefulWidget {
  const TimeoutSwitcher({
    Key? key,
    required this.timedOutChild,
    this.initialChild = const SizedBox(),
    this.timeout = const Duration(milliseconds: 200),
    this.switchDuration = const Duration(milliseconds: 100),
  }) : super(key: key);

  final Widget timedOutChild;
  final Widget initialChild;
  final Duration timeout;
  final Duration switchDuration;

  @override
  _TimeoutSwitcherState createState() => _TimeoutSwitcherState();
}

class _TimeoutSwitcherState extends State<TimeoutSwitcher> {
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
