import 'package:flutter/material.dart';

class RippleEffectButton extends StatelessWidget {
  const RippleEffectButton({
    Key key,
    @required this.child,
    @required this.onTap,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
