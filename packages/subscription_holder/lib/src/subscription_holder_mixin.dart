import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';

import 'subscription_holder.dart';

mixin SubscriptionHolderMixin<T> on StateNotifier<T> {
  @protected
  final SubscriptionHolder subscriptionHolder = SubscriptionHolder();

  @override
  @mustCallSuper
  void dispose() {
    subscriptionHolder.dispose();

    super.dispose();
  }
}
