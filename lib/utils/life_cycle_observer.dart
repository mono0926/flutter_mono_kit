import 'package:disposable_provider/disposable_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

// ignore: prefer_mixin
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

  final _binding = WidgetsBinding.instance;
  BehaviorSubject<AppLifecycleState> _state;

  ValueObservable<AppLifecycleState> get stateValue => _state;
  Stream<AppLifecycleState> get stateStream => stateValue.skip(1);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _state.value = state;
  }

  @override
  void dispose() {
    _state.close();
  }
}
