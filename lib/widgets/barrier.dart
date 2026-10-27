import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mono_kit/mono_kit.dart';

final barrierProvider = NotifierProvider<BarrierController, bool>(
  BarrierController.new,
);

class const Barrier({
  super.key,
  required final Widget child,
  final Color? valueColor,
  final Color? backgroundColor,
  final Duration timeout = const Duration(milliseconds: 200),
  final Duration switchDuration = const Duration(milliseconds: 100),
}) extends ConsumerWidget {
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
              initialChild: const SizedBox.expand(child: AbsorbPointer()),
              timedOutChild: ColoredBox(
                color:
                    backgroundColor ??
                    theme.scaffoldBackgroundColor.withValues(alpha: 0.6),
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

class BarrierController() extends Notifier<bool> {
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

  @override
  bool build() => false;
}

class const PopBarrier({super.key, required final Widget child})
    extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(canPop: !ref.watch(barrierProvider), child: child);
  }
}
