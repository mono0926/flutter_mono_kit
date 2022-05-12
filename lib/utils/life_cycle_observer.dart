import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final lifecycleObserver = Provider<AsyncValue<AppLifecycleState>>((ref) {
  final observer = AppLifecycleStateObserver(
    (state) => ref.state = AsyncData(state),
  );
  final binding = WidgetsBinding.instance..addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
  return const AsyncLoading();
});

class AppLifecycleStateObserver extends WidgetsBindingObserver {
  AppLifecycleStateObserver(this._didChange);

  final ValueChanged<AppLifecycleState> _didChange;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _didChange(state);
  }
}
