import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class RippleEffectButton extends SingleChildStatelessWidget {
  const RippleEffectButton({
    super.key,
    super.child,
    required this.onTap,
    required this.borderRadius,
  });

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
