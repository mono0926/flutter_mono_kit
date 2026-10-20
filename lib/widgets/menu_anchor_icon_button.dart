import 'package:flutter/material.dart';

Widget menuAnchorIconButtonBuilder(
  BuildContext context,
  MenuController controller,
  Widget? child,
) => MenuAnchorIconButton(controller: controller);

class MenuAnchorIconButton extends StatelessWidget {
  const MenuAnchorIconButton({
    super.key,
    required this.controller,
  });

  final MenuController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: controller.toggle,
      icon: Icon(Icons.adaptive.more),
      tooltip: MaterialLocalizations.of(context).showMenuTooltip,
    );
  }
}

extension MenuControllerEx on MenuController {
  void toggle() {
    if (isOpen) {
      close();
    } else {
      open();
    }
  }
}
