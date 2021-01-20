import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:nested/nested.dart';

class AppBottomArea extends SingleChildStatefulWidget {
  const AppBottomArea({
    Key key,
    Widget child,
    this.bottom,
  }) : super(key: key, child: child);

  final Widget bottom;

  @override
  _AppBottomAreaState createState() => _AppBottomAreaState();
}

class _AppBottomAreaState extends SingleChildState<AppBottomArea> {
  var _bottomHeight = 0.0;

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bottomDiff = mediaQuery.size.height - constraints.maxHeight;
              final paddingBottom = max<double>(
                0,
                mediaQuery.padding.bottom - _bottomHeight,
              );
              return MediaQuery(
                data: mediaQuery.copyWith(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  padding: mediaQuery.padding.copyWith(
                    bottom: paddingBottom,
                  ),
                  viewPadding: mediaQuery.viewPadding.copyWith(
                    bottom: paddingBottom,
                  ),
                  viewInsets: mediaQuery.viewInsets.copyWith(
                    bottom: max(
                      0,
                      mediaQuery.viewInsets.bottom - bottomDiff,
                    ),
                  ),
                ),
                child: child,
              );
            },
          ),
        ),
        if (widget.bottom != null)
          SizeListener(
            child: widget.bottom,
            onSizeChanged: (size) {
              final bottomHeight = size.height;
              if (bottomHeight != _bottomHeight) {
                setState(() {
                  _bottomHeight = bottomHeight;
                });
              }
            },
          ),
      ],
    );
  }
}
