import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UnfocusOnTap extends StatelessWidget {
  const UnfocusOnTap({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
