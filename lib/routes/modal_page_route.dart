import 'package:material_ui/material_ui.dart';

class ModalPageRoute<T>({
  required super.builder,
  required super.settings,
}) extends MaterialPageRoute<T> {
  this
    : super(
        fullscreenDialog: true,
      );
}
