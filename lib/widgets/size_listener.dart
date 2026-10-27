import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

typedef SizeChangedCallback = void Function(Size size);

class const SizeListener({
  super.key,
  super.child,
  required final SizeChangedCallback onSizeChanged,
}) extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) =>
      _SizeListenerRenderObject(onSizeChanged: onSizeChanged);
}

class _SizeListenerRenderObject({
  RenderBox? child,
  required final SizeChangedCallback onSizeChanged,
}) extends RenderProxyBox {
  this : super(child);
  Size? _size;

  @override
  void performLayout() {
    super.performLayout();

    final size = this.size;
    if (size != _size) {
      _size = size;
      WidgetsBinding.instance.addPostFrameCallback((_) => onSizeChanged(size));
    }
  }
}
