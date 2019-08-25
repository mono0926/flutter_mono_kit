import 'package:disposable_provider/disposable_provider.dart';
import 'package:flutter/foundation.dart';

mixin ProgressMixin implements Disposable {
  final _inProgress = ValueNotifier<bool>(false);

  ValueListenable<bool> get inProgress => _inProgress;

  // ignore: use_setters_to_change_properties
  @protected
  void updateProgress({@required bool inProgress}) {
    _inProgress.value = inProgress;
  }

  @protected
  Future<T> executeWithProgress<T>(Future<T> Function() f) async {
    updateProgress(inProgress: true);
    final result = await f();
    updateProgress(inProgress: false);
    return result;
  }

  @override
  @mustCallSuper
  void dispose() {
    _inProgress.dispose();
  }
}