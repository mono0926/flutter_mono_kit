import 'package:material_ui/material_ui.dart';

class const CenteredMaxWidth({
  super.key,
  required final Widget child,
  final double width = 768,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: child,
      ),
    );
  }
}
