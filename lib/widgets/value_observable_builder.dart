import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

import 'better_stream_builder.dart';

class ValueObservableBuilder<T> extends StatefulWidget {
  const ValueObservableBuilder({
    Key key,
    @required this.builder,
    @required this.stream,
    this.child,
    this.reuseChild = true,
  }) : super(key: key);

  final ValueObservable<T> stream;
  final AsyncChildWidgetBuilder<T> builder;
  final Widget child;
  final bool reuseChild;

  @override
  _ValueObservableBuilderState createState() =>
      _ValueObservableBuilderState<T>();
}

class _ValueObservableBuilderState<T> extends State<ValueObservableBuilder<T>> {
  AsyncSnapshot<T> _snapshot;
  Widget _built;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      initialData: widget.stream.value,
      stream: widget.stream,
      builder: (context, snapshot) {
        // ValueObservableの場合、初期値があったらwaitingでは無いとみなす方が自然。
        // また、この加工をすることで初回の無駄な2回のリビルドが解消される。
        if (snapshot.connectionState == ConnectionState.waiting &&
            snapshot.hasData) {
          snapshot = AsyncSnapshot<T>.withData(
            ConnectionState.active,
            snapshot.data,
          );
        }
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
