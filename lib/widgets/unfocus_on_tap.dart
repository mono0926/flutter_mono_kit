import 'package:material_ui/material_ui.dart';
import 'package:nested/nested.dart';

class const UnfocusOnTap({
  super.key,
  required Widget super.child,
}) extends SingleChildStatelessWidget {
  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
