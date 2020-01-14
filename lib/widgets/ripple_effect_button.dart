import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class RippleEffectButton extends SingleChildStatelessWidget {
  const RippleEffectButton({
    Key key,
    @required Widget child,
    @required this.onTap,
  }) : super(
          key: key,
          child: child,
        );

  final VoidCallback onTap;

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return Stack(
      fit: StackFit.passthrough,
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
