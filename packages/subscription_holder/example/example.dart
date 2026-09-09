import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:subscription_holder/subscription_holder.dart';

void main() {
  final holder = SubscriptionHolder();

  final stream = Stream<int>.periodic(
    const Duration(seconds: 1),
    (count) => count,
  );

  holder
    ..add(
      stream.listen((data) {
        if (kDebugMode) {
          print('Received: $data');
        }
      }),
    )
    // Dispose all held subscriptions when done
    ..dispose();
}
