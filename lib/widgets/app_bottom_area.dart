import 'dart:math';

import 'package:material_ui/material_ui.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:nested/nested.dart';

class const AppBottomArea({
  super.key,
  required Widget super.child,
  final Widget? bottom,
}) extends SingleChildStatefulWidget {
  @override
  SingleChildState<AppBottomArea> createState() => _AppBottomAreaState();
}

class _AppBottomAreaState() extends SingleChildState<AppBottomArea> {
  var _bottomHeight = 0.0;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    final mediaQuery = MediaQuery.of(context);
    final bottom = widget.bottom;
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
                  size: constraints.biggest,
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
                child: child!,
              );
            },
          ),
        ),
        if (bottom != null)
          SizeListener(
            onSizeChanged: (size) {
              final bottomHeight = size.height;
              if (bottomHeight != _bottomHeight) {
                setState(() {
                  _bottomHeight = bottomHeight;
                });
              }
            },
            child: bottom,
          ),
      ],
    );
  }
}
