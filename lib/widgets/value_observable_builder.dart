import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

/// - https://raw.githubusercontent.com/Kavantix/bloc_streambuilder/master/lib/src/value_observable_builder.dart
/// - https://twitter.com/_mono/status/1078948544784941058
class ValueObservableBuilder<T> extends StatefulWidget {
  const ValueObservableBuilder({
    Key key,
    @required this.builder,
    @required this.stream,
    this.child,
  }) : super(key: key);

  final ValueObservable<T> stream;
  final AsyncWidgetBuilder<T> builder;
  final Widget child;

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
        if (snapshot.connectionState == ConnectionState.waiting &&
            snapshot.hasData) {
          snapshot = AsyncSnapshot<T>.withData(
            ConnectionState.active,
            snapshot.data,
          );
        }
        // 必要な時(初回・snapshotに差がある時)だけリビルド
        if (_built == null || _snapshot != snapshot) {
          _built = widget.builder(
            context,
            snapshot,
            widget.child,
          );
        }
        _snapshot = snapshot;
        return _built;
      },
    );
  }
}

typedef AsyncWidgetBuilder<T> = Widget Function(
  BuildContext context,
  AsyncSnapshot<T> snap,
  Widget child,
);
