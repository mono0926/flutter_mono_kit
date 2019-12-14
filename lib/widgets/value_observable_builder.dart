import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

import 'better_stream_builder.dart';

class ValueObservableBuilder<T> extends StatefulWidget {
  const ValueObservableBuilder({
    Key key,
    @required this.builder,
    @required this.stream,
    this.child,
  }) : super(key: key);

  final ValueStream<T> stream;
  final AsyncChildWidgetBuilder<T> builder;
  final Widget child;

  @override
  _ValueObservableBuilderState createState() =>
      _ValueObservableBuilderState<T>();
}

class _ValueObservableBuilderState<T> extends State<ValueObservableBuilder<T>> {
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
        return widget.builder(context, snapshot, widget.child);
      },
    );
  }
}
