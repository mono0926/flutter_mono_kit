import 'package:flutter/widgets.dart';
import 'package:nested/nested.dart';
import 'package:rxdart/rxdart.dart';

import 'better_stream_builder.dart';

class const ValueObservableBuilder<T>({
  super.key,
  required final AsyncChildWidgetBuilder<T> builder,
  required final ValueStream<T> stream,
  super.child,
}) extends SingleChildStatefulWidget {
  @override
  SingleChildState<ValueObservableBuilder<T>> createState() =>
      _ValueObservableBuilderState<T>();
}

class _ValueObservableBuilderState<T>()
    extends SingleChildState<ValueObservableBuilder<T>> {
  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return StreamBuilder<T>(
      initialData: widget.stream.valueOrNull,
      stream: widget.stream,
      builder: (context, snapshot) {
        // ValueObservableの場合、初期値があったらwaitingでは無いとみなす方が自然。
        // また、この加工をすることで初回の無駄な2回のリビルドが解消される。
        final effectiveSnapshot =
            (snapshot.connectionState == ConnectionState.waiting &&
                snapshot.hasData)
            ? AsyncSnapshot<T>.withData(
                ConnectionState.active,
                snapshot.data as T,
              )
            : snapshot;
        return widget.builder(context, effectiveSnapshot, child);
      },
    );
  }
}
