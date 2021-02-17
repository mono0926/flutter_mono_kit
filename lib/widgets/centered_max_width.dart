import 'package:flutter/material.dart';

class CenteredMaxWidth extends StatelessWidget {
  const CenteredMaxWidth({
    Key? key,
    required this.child,
    this.width = 768,
  }) : super(key: key);

  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: child,
      ),
    );
  }
}
