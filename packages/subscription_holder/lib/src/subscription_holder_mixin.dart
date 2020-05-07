import 'package:disposable_provider/disposable_provider.dart';
import 'package:flutter/foundation.dart';

import 'subscription_holder.dart';

mixin SubscriptionHolderMixin implements Disposable {
  @protected
  final SubscriptionHolder subscriptionHolder = SubscriptionHolder();

  @override
  @mustCallSuper
  void dispose() {
    subscriptionHolder.dispose();
  }
}
