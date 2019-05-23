import 'package:flutter/widgets.dart';

class BetterStreamBuilder<T> extends StatefulWidget {
  const BetterStreamBuilder({
    Key key,
    this.initialData,
    @required this.stream,
    @required this.builder,
    this.child,
    this.reuseChild = true,
  }) : super(key: key);

  final Stream<T> stream;
  final AsyncChildWidgetBuilder<T> builder;
  final T initialData;
  final Widget child;
  final bool reuseChild;

  @override
  _BetterStreamBuilderState<T> createState() => _BetterStreamBuilderState<T>();
}

class _BetterStreamBuilderState<T> extends State<BetterStreamBuilder<T>> {
  AsyncSnapshot<T> _snapshot;
  Widget _built;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      initialData: widget.initialData,
      stream: widget.stream,
      builder: (context, snapshot) {
        // 必要な時(初回・snapshotに差がある時)だけリビルド
        if (_built == null || !widget.reuseChild || _snapshot != snapshot) {
          _built = widget.builder(context, snapshot, widget.child);
        }
        _snapshot = snapshot;
        return _built;
      },
    );
  }
}

typedef AsyncChildWidgetBuilder<T> = Widget Function(
  BuildContext context,
  AsyncSnapshot<T> snap,
  Widget child,
);
