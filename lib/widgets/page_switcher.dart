import 'package:flutter/material.dart';

class PageSwitcher extends StatelessWidget {
  const PageSwitcher({
    super.key,
    required this.pages,
    this.index = 0,
  });

  final List<Widget> pages;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (final (i, page) in pages.indexed)
          Visibility(
            visible: i == index,
            maintainState: true,
            child: page,
          ),
      ],
    );
  }
}
