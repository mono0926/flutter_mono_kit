import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class UnfocusOnTap extends SingleChildStatelessWidget {
  const UnfocusOnTap({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
