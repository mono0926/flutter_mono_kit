import 'package:flutter/material.dart';

class ModalPageRoute<T> extends MaterialPageRoute<T> {
  ModalPageRoute({
    required WidgetBuilder builder,
    @required RouteSettings? settings,
  }) : super(
          builder: (context) => builder(context),
          fullscreenDialog: true,
          settings: settings,
        );
}
