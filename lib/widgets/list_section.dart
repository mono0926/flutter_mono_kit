import 'package:flutter/material.dart';

import 'list_section_header.dart';

class ListSection extends StatelessWidget {
  const ListSection({
    super.key,
    required this.label,
    this.children = const [],
    this.hasTopBorder = true,
  });

  final List<Widget> children;
  final String label;
  final bool hasTopBorder;

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
