import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

@immutable
class SubscriptionHolder {
  final _subscriptions = <StreamSubscription<dynamic>>[];

  void add(StreamSubscription<dynamic> subscription) {
    _subscriptions.add(subscription);
  }

  ValueStream<S?> publishValueConnecting<T, S>(
    ValueStream<T> observable,
    FutureOr<S?> Function(T? value) f,
  ) {
    final v = f(observable.valueOrNull);
    final valueObservable = observable
        .asyncMap(f)
        .distinct()
        .publishValueSeeded(v is Future ? null : v as S);
    _subscriptions.add(valueObservable.connect());

    return valueObservable;
  }

  ValueListenable<S?> consumeAsListenable<T, S>(
    ValueStream<T> observable,
    FutureOr<S?> Function(T? value) f,
  ) {
    final v = f(observable.valueOrNull);
    final notifier = ValueNotifier<S?>(v is Future<S> ? null : v as S);
    _subscriptions.add(
      observable.distinct().listen((x) async => notifier.value = await f(x)),
    );
    return notifier;
  }

  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions.clear();
  }
}
