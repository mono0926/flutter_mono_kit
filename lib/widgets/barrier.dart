import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:mono_kit/widgets/value_notifier_provider.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class Barrier extends SingleChildStatelessWidget {
  const Barrier({
    Key key,
    Widget child,
    this.valueColor,
    this.backgroundColor,
    this.timeout = const Duration(milliseconds: 200),
    this.switchDuration = const Duration(milliseconds: 100),
  }) : super(
          key: key,
          child: child,
        );

  final Color valueColor;
  final Color backgroundColor;
  final Duration timeout;
  final Duration switchDuration;

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    final theme = Theme.of(context);
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        Positioned.fill(
          child: Visibility(
            visible: context.watch<BarrierState>() == BarrierState.inProgress,
            child: TimeoutSwitcher(
              timeout: timeout,
              switchDuration: switchDuration,
              initialChild: const SizedBox.expand(
                child: AbsorbPointer(),
              ),
              timedOutChild: Container(
                color: backgroundColor ??
                    theme.scaffoldBackgroundColor.withOpacity(0.6),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(valueColor),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class BarrierController extends ValueNotifier<BarrierState> {
  BarrierController() : super(BarrierState.none);

  void startProgress() => value = BarrierState.inProgress;

  void stopProgress() => value = BarrierState.none;

  void toggleProgress() {
    switch (value) {
      case BarrierState.none:
        startProgress();
        break;
      case BarrierState.inProgress:
        stopProgress();
        break;
    }
  }

  /// Execute f() with showing progress.
  Future<T> executeWithProgress<T>(Future<T> Function() f) async {
    try {
      startProgress();
      return await f();
    } finally {
      stopProgress();
    }
  }
}

enum BarrierState {
  none,
  inProgress,
}

class BarrierControllerProvider extends SingleChildStatelessWidget {
  const BarrierControllerProvider({
    Key key,
    Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return ValueNotifierProvider<BarrierController, BarrierState>(
      create: (context) => BarrierController(),
      child: child,
    );
  }
}

class BarrierKit extends SingleChildStatelessWidget {
  const BarrierKit({Key key}) : super(key: key);
  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return BarrierControllerProvider(
      child: Barrier(
        child: child,
      ),
    );
  }
}
