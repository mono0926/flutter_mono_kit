import 'package:flutter/material.dart';

class ModalPageRoute<T> extends MaterialPageRoute<T> {
  ModalPageRoute({
    required super.builder,
    required super.settings,
  }) : super(
         fullscreenDialog: true,
       );
}
