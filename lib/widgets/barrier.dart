import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  const Barrier({
    Key key,
    @required this.child,
    @required this.showProgress,
  }) : super(key: key);

  final Widget child;
  final bool showProgress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        Positioned.fill(
          child: Visibility(
            visible: showProgress,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
