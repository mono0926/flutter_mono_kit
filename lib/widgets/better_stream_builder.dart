import 'package:flutter/widgets.dart';

class const BetterStreamBuilder<T>({
  super.key,
  final T? initialData,
  required final Stream<T> stream,
  required final AsyncChildWidgetBuilder<T> builder,
  final Widget? child,
}) extends StatefulWidget {
  @override
  State<BetterStreamBuilder<T>> createState() => _BetterStreamBuilderState<T>();
}

class _BetterStreamBuilderState<T>() extends State<BetterStreamBuilder<T>> {
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
