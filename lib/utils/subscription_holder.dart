import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

@immutable
class SubscriptionHolder {
  final _subscriptions = <StreamSubscription>[];

  void add(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }

  ValueObservable<S> publishValueConnecting<T, S>(
    ValueObservable<T> observable,
    S Function(T value) f,
  ) {
    final valueObservable =
        observable.map(f).distinct().publishValueSeeded(f(observable.value));
    _subscriptions.add(valueObservable.connect());
    return valueObservable;
  }

  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions.clear();
  }
}

mixin SubscriptionHolderMixin {
  @protected
  final subscriptionHolder = SubscriptionHolder();

  @mustCallSuper
  void dispose() {
    subscriptionHolder.dispose();
  }
}
