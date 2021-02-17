import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class DeviceFrame extends SingleChildStatelessWidget {
  const DeviceFrame({
    Key? key,
    required this.builder,
    Widget? child,
    this.enabled = false,
  }) : super(key: key, child: child);

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
