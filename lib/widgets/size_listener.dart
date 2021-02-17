import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

typedef _SizeChangedCallback = void Function(Size size);

class SizeListener extends SingleChildRenderObjectWidget {
  const SizeListener({
    Key? key,
    Widget? child,
    required this.onSizeChanged,
  }) : super(
          key: key,
          child: child,
        );
  final _SizeChangedCallback onSizeChanged;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _SizeListenerRenderObject(onSizeChanged: onSizeChanged);
}

class _SizeListenerRenderObject extends RenderProxyBox {
  _SizeListenerRenderObject({
    RenderBox? child,
    required this.onSizeChanged,
  }) : super(child);
  final _SizeChangedCallback onSizeChanged;

  Size? _size;

  @override
  void performLayout() {
    super.performLayout();

    final size = this.size;
    if (size != _size) {
      _size = size;
      WidgetsBinding.instance!.addPostFrameCallback((_) => onSizeChanged(size));
    }
  }
}
