import 'package:material_ui/material_ui.dart';
import 'package:nested/nested.dart';

class const TilePadding({
  super.key,
  super.child,
  final double? horizontal,
}) extends SingleChildStatelessWidget {
  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return SafeArea(
      top: false,
      bottom: false,
      minimum: EdgeInsets.symmetric(
        horizontal: horizontal ?? 16,
      ),
      child: child!,
    );
  }
}
