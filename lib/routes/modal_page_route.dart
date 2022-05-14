import 'package:flutter/material.dart';

class ModalPageRoute<T> extends MaterialPageRoute<T> {
  ModalPageRoute({
    required WidgetBuilder builder,
    @required super.settings,
  }) : super(
          builder: (context) => builder(context),
          fullscreenDialog: true,
        );
}
