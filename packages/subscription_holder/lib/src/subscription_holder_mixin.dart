import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';

import 'subscription_holder.dart';

mixin SubscriptionHolderMixin on StateNotifier {
  @protected
  final SubscriptionHolder subscriptionHolder = SubscriptionHolder();

  @override
  @mustCallSuper
  void dispose() {
    subscriptionHolder.dispose();

    super.dispose();
  }
}
