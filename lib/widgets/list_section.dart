import 'package:material_ui/material_ui.dart';

import 'list_section_header.dart';

class const ListSection({
  super.key,
  required final String label,
  final List<Widget> children = const [],
  final bool hasTopBorder = true,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListSectionHeader(
          label: label,
          hasTopBorder: hasTopBorder,
        ),
        ...children,
      ],
    );
  }
}
