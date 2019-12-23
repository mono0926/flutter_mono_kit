import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'listener/listener.dart';

class Barrier extends StatelessWidget {
  const Barrier({
    Key key,
    @required this.child,
    @required this.showProgress,
    this.valueColor,
  }) : super(key: key);

  Barrier.value({
    Key key,
    Widget child,
    @required bool showProgress,
  }) : this(
            key: key,
            child: child,
            showProgress: ValueNotifier<bool>(showProgress));

  final Widget child;
  final ValueListenable<bool> showProgress;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        Positioned.fill(
          child: ListenerVisibility(
            visible: showProgress,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(valueColor),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
