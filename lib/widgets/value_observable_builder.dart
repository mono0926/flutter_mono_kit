import 'package:flutter/widgets.dart';
import 'package:nested/nested.dart';
import 'package:rxdart/rxdart.dart';

import 'better_stream_builder.dart';

class ValueObservableBuilder<T> extends SingleChildStatefulWidget {
  const ValueObservableBuilder({
    Key? key,
    required this.builder,
    required this.stream,
    Widget? child,
  }) : super(
          key: key,
          child: child,
        );

  final ValueStream<T> stream;
  final AsyncChildWidgetBuilder<T> builder;

  @override
  _ValueObservableBuilderState createState() =>
      _ValueObservableBuilderState<T>();
}

class _ValueObservableBuilderState<T>
    extends SingleChildState<ValueObservableBuilder<T>> {
  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
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
            snapshot.data as T,
          );
        }
        return widget.builder(context, snapshot, child);
      },
    );
  }
}
