import 'package:disposable_provider/disposable_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final lifecycleObserver = Provider((ref) => LifeCycleObserver());

class LifeCycleObserver with WidgetsBindingObserver implements Disposable {
  LifeCycleObserver({
    AppLifecycleState initialState = AppLifecycleState.resumed,
  }) {
    _state = BehaviorSubject<AppLifecycleState>.seeded(
      initialState,
      onListen: () {
        _binding.addObserver(this);
      },
      onCancel: () {
        _binding.removeObserver(this);
      },
    );
  }

  final _binding = WidgetsBinding.instance!;
  late final BehaviorSubject<AppLifecycleState> _state;

  ValueStream<AppLifecycleState> get stateValue => _state;
  Stream<AppLifecycleState> get stateStream => stateValue.skip(1);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _state.add(state);
  }

  @override
  void dispose() {
    _state.close();
  }
}
