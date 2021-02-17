import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class TilePadding extends SingleChildStatelessWidget {
  const TilePadding({
    Key? key,
    Widget? child,
    this.horizontal,
  }) : super(
          key: key,
          child: child,
        );

  final double? horizontal;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return SafeArea(
      top: false,
      bottom: false,
      minimum: EdgeInsets.symmetric(
        horizontal: horizontal ?? 16,
      ),
      child: child!,
    );
  }
}
