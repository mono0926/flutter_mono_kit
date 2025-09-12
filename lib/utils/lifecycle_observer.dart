import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lifecycleObserver =
    AsyncNotifierProvider<AppLifecycleStateObserver, AppLifecycleState>(
      AppLifecycleStateObserver.new,
    );

class AppLifecycleStateObserver extends AsyncNotifier<AppLifecycleState>
    with WidgetsBindingObserver {
  @override
  FutureOr<AppLifecycleState> build() {
    final binding = WidgetsBinding.instance..addObserver(this);
    ref.onDispose(() => binding.removeObserver(this));
    return future;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    this.state = AsyncValue.data(state);
    super.didChangeAppLifecycleState(state);
  }
}
