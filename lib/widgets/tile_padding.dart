import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class TilePadding extends SingleChildStatelessWidget {
  const TilePadding({
    Key key,
    Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }
}
