import 'dart:async';

import 'package:flutter/widgets.dart';

@immutable
class SubscriptionHolder {
  final _subscriptions = <StreamSubscription>[];

  void add(StreamSubscription subscription) {
    _subscriptions.add(subscription);
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
