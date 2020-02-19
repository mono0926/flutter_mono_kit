// https://github.com/rrousselGit/flutter_architecture_samples/blob/freezed_sample/freezed_provider_value_notifier/lib/value_notifier_provider.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// Don't bother about understand this – you can just copy-paste it in your app.
// It may get merged into `provider` at some point.

class ValueNotifierProvider<Controller extends ValueNotifier<Value>, Value>
    extends SingleChildStatelessWidget {
  const ValueNotifierProvider({
    @required this.create,
    Widget child,
  }) : super(child: child);

  final Create<Controller> create;

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return InheritedProvider(
      create: create,
      child: DeferredInheritedProvider<Controller, Value>(
        create: (context) => context.read<Controller>(),
        startListening: (context, setState, controller, _) {
          setState(controller.value);
          void listener() => setState(controller.value);
          controller.addListener(listener);
          return () => controller.removeListener(listener);
        },
        child: child,
      ),
    );
  }
}
