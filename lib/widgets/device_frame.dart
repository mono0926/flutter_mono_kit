import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class DeviceFrame extends SingleChildStatelessWidget {
  const DeviceFrame({
    super.key,
    required this.builder,
    super.child,
    this.enabled = false,
  });

  final TransitionBuilder builder;
  final bool enabled;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    if (!enabled) {
      return child!;
    }
    return builder(
      context,
      LayoutBuilder(
        builder: (context, constraints) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              size: Size(
                constraints.maxWidth,
                constraints.maxHeight,
              ),
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
