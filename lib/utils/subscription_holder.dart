import 'dart:async';

import 'package:flutter/foundation.dart';
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

  ValueListenable<S> consumeAsListenable<T, S>(
    ValueObservable<T> observable,
    S Function(T value) f,
  ) {
    final notifier = ValueNotifier<S>(f(observable.value));
    _subscriptions
        .add(observable.distinct().listen((x) => notifier.value = f(x)));
    return notifier;
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
