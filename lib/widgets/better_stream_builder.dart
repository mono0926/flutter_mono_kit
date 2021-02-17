import 'package:flutter/widgets.dart';

class BetterStreamBuilder<T> extends StatefulWidget {
  const BetterStreamBuilder({
    Key? key,
    this.initialData,
    required this.stream,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Stream<T> stream;
  final AsyncChildWidgetBuilder<T> builder;
  final T? initialData;
  final Widget? child;

  @override
  _BetterStreamBuilderState<T> createState() => _BetterStreamBuilderState<T>();
}

class _BetterStreamBuilderState<T> extends State<BetterStreamBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      initialData: widget.initialData,
      stream: widget.stream,
      builder: (context, snapshot) {
        return widget.builder(context, snapshot, widget.child);
      },
    );
  }
}

typedef AsyncChildWidgetBuilder<T> = Widget Function(
  BuildContext context,
  AsyncSnapshot<T> snap,
  Widget? child,
);
