import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lifecycleObserver = StreamProvider<AppLifecycleState>((ref) async* {
  final observer = AppLifecycleStateObserver(
    (state) {
      ref.state = AsyncData(state);
    },
  );
  final binding = WidgetsBinding.instance..addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
});

class AppLifecycleStateObserver extends WidgetsBindingObserver {
  AppLifecycleStateObserver(this._didChange);

  final ValueChanged<AppLifecycleState> _didChange;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _didChange(state);
  }
}
