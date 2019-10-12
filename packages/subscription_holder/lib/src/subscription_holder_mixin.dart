import 'package:flutter/foundation.dart';

import 'subscription_holder.dart';

mixin SubscriptionHolderMixin {
  @protected
  final SubscriptionHolder subscriptionHolder = SubscriptionHolder();

  @mustCallSuper
  void dispose() {
    subscriptionHolder.dispose();
  }
}
