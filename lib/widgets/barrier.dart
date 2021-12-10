import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mono_kit/mono_kit.dart';

final barrierProvider = StateNotifierProvider<BarrierController, bool>(
  (ref) => BarrierController(),
);

class Barrier extends ConsumerWidget {
  const Barrier({
    Key? key,
    required this.child,
    this.valueColor,
    this.backgroundColor,
    this.timeout = const Duration(milliseconds: 200),
    this.switchDuration = const Duration(milliseconds: 100),
  }) : super(key: key);

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

// class _HOge extends StatefulWidget {
//   const _HOge({Key? key}) : super(key: key);
//   @override
//   __HOgeState createState() => __HOgeState();
// }
//
// class __HOgeState extends State<_HOge> with WidgetsBindingObserver {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//
//   @override
//   Future<bool> didPopRoute() {
//     return super.didPopRoute();
//   }
// }
