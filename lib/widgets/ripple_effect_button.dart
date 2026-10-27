import 'package:material_ui/material_ui.dart';
import 'package:nested/nested.dart';

class const RippleEffectButton({
  super.key,
  super.child,
  required final VoidCallback onTap,
  required final BorderRadius borderRadius,
}) extends SingleChildStatelessWidget {
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
