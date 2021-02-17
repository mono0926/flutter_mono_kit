import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class RippleEffectButton extends SingleChildStatelessWidget {
  const RippleEffectButton({
    Key? key,
    Widget? child,
    required this.onTap,
    required this.borderRadius,
  }) : super(
          key: key,
          child: child,
        );

  final VoidCallback onTap;
  final BorderRadius borderRadius;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child!,
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
