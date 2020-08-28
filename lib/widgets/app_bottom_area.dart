import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class AppBottomArea extends SingleChildStatelessWidget {
  const AppBottomArea({
    Key key,
    Widget child,
    this.bottom,
  }) : super(key: key, child: child);

  final Widget bottom;

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bottomDiff = mediaQuery.size.height - constraints.maxHeight;
              return MediaQuery(
                data: mediaQuery.removeViewPadding(removeBottom: true).copyWith(
                      size: Size(constraints.maxWidth, constraints.maxHeight),
                      viewInsets: mediaQuery.viewInsets.copyWith(
                        bottom:
                            max(0, mediaQuery.viewInsets.bottom - bottomDiff),
                      ),
                    ),
                child: child,
              );
            },
          ),
        ),
        if (bottom != null) bottom,
      ],
    );
  }
}
