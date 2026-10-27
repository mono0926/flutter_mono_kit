import 'package:material_ui/material_ui.dart';
import 'package:mono_kit/mono_kit.dart';

class const LoadingSwitcher({
  super.key,
  final Widget? child,
  final Widget timedOutChild = const Center(
    child: CircularProgressIndicator(),
  ),
  final Widget initialChild = const SizedBox(),
  final Duration timeout = const Duration(milliseconds: 200),
  final Duration switchDuration = const Duration(milliseconds: 100),
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: switchDuration,
      child:
          child ??
          TimeoutSwitcher(
            timedOutChild: timedOutChild,
            initialChild: initialChild,
            timeout: timeout,
            switchDuration: switchDuration,
          ),
    );
  }
}
