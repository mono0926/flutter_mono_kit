import 'package:disposable_provider/disposable_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class Barrier extends SingleChildStatelessWidget {
  const Barrier({
    Key key,
    Widget child,
    this.showProgress,
    this.valueColor,
    this.backgroundColor,
    this.timeout = const Duration(milliseconds: 200),
    this.switchDuration = const Duration(milliseconds: 100),
  }) : super(
          key: key,
          child: child,
        );

  final ValueListenable<bool> showProgress;
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
          child: ValueListenableBuilder<bool>(
            valueListenable:
                showProgress ?? context.read<BarrierController>().inProgress,
            builder: (context, visible, child) => Visibility(
              visible: visible,
              child: child,
            ),
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

class BarrierController with Disposable {
  final _inProgress = ValueNotifier(false);

  ValueListenable<bool> get inProgress => _inProgress;

  void startProgress() => _inProgress.value = true;

  void stopProgress() => _inProgress.value = false;

  void toggleProgress() => _inProgress.value = !_inProgress.value;

  /// Execute f() with showing progress.
  Future<T> executeWithProgress<T>(Future<T> Function() f) async {
    try {
      startProgress();
      return await f();
    } finally {
      stopProgress();
    }
  }

  @override
  void dispose() {
    _inProgress.dispose();
  }
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
    return DisposableProvider(
      create: (context) => BarrierController(),
      child: child,
    );
  }
}

class BarrierKit extends SingleChildStatelessWidget {
  const BarrierKit({
    Key key,
    Widget child,
  }) : super(
          key: key,
          child: child,
        );
  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return BarrierControllerProvider(
      child: Barrier(
        child: child,
      ),
    );
  }
}
