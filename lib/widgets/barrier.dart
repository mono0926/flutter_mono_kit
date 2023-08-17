import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono_kit/mono_kit.dart';

final barrierProvider = StateNotifierProvider<BarrierController, bool>(
  (ref) => BarrierController(),
);

class Barrier extends ConsumerWidget {
  const Barrier({
    super.key,
    required this.child,
    this.valueColor,
    this.backgroundColor,
    this.timeout = const Duration(milliseconds: 200),
    this.switchDuration = const Duration(milliseconds: 100),
  });

  final Widget child;
  final Color? valueColor;
  final Color? backgroundColor;
  final Duration timeout;
  final Duration switchDuration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final visible = ref.watch(barrierProvider);
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        Positioned.fill(
          child: Visibility(
            visible: visible,
            child: TimeoutSwitcher(
              timeout: timeout,
              switchDuration: switchDuration,
              initialChild: const SizedBox.expand(
                child: AbsorbPointer(),
              ),
              timedOutChild: ColoredBox(
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
        ),
      ],
    );
  }
}

class BarrierController extends StateNotifier<bool> {
  BarrierController() : super(false);

  void startProgress() => state = true;

  void stopProgress() => state = false;

  void toggleProgress() => state = !state;

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

class PopBarrier extends ConsumerWidget {
  const PopBarrier({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      child: child,
      onWillPop: () => Future.value(!ref.read(barrierProvider)),
    );
  }
}
