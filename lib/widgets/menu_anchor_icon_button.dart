import 'package:material_ui/material_ui.dart';

Widget menuAnchorIconButtonBuilder(
  BuildContext context,
  MenuController controller,
  Widget? child,
) => MenuAnchorIconButton(controller: controller);

class const MenuAnchorIconButton({
  super.key,
  required final MenuController controller,
}) extends StatelessWidget {
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
