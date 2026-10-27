import 'package:material_ui/material_ui.dart';
import 'package:nested/nested.dart';

class const DeviceFrame({
  super.key,
  required final TransitionBuilder builder,
  super.child,
  final bool enabled = false,
}) extends SingleChildStatelessWidget {
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
              size: constraints.biggest,
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
