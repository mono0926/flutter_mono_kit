import 'package:material_ui/material_ui.dart';

class const PageSwitcher({
  super.key,
  required final List<Widget> pages,
  final int index = 0,
}) extends StatelessWidget {
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
