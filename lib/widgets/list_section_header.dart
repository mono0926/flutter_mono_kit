import 'package:material_ui/material_ui.dart';

class const ListSectionHeader({
  super.key,
  required final String label,
  final bool hasTopBorder = true,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    // ignore: use_decorated_box
    return Container(
      decoration: hasTopBorder
          ? BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: theme.dividerColor,
                  width: 0, // = 1pixel
                ),
              ),
            )
          : null,
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
