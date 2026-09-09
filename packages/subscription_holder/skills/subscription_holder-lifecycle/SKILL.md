---
name: subscription_holder-lifecycle
description: >-
  Use when managing and automatically cancelling multiple Dart StreamSubscriptions
  in Flutter State, ChangeNotifier, or StateNotifier classes using subscription_holder.
---

# subscription_holder Lifecycle Management Guide

`subscription_holder` eliminates manual tracking and disposal of multiple `StreamSubscription` instances. It acts as a disposable container (similar to Rx CompositeDisposable) that cancels all active subscriptions cleanly when tearing down state.

## Guidelines

- **Using `SubscriptionHolder`**:
  - Instantiate `final _subscriptions = SubscriptionHolder();`.
  - Add active subscriptions via `_subscriptions.add(stream.listen(...))` or use the fluent extension `.addTo(_subscriptions)`.
  - Call `_subscriptions.dispose()` inside `State.dispose()`, `ChangeNotifier.dispose()`, or controller teardown.
- **Using `SubscriptionHolderMixin`**:
  - Mix in `SubscriptionHolderMixin` directly onto state classes or controller classes to access `addSubscription(stream.listen(...))` and automatic disposal.
- **Auto-Cancellation**:
  - `dispose()` cancels all registered subscriptions and prevents subsequent additions.
  - To cancel existing subscriptions without invalidating the container (e.g., when resetting state), call `_subscriptions.cancelAll()`.

## Examples

### 1. Managing Subscriptions in a StatefulWidget

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:subscription_holder/subscription_holder.dart';

class EventMonitorWidget extends StatefulWidget {
  const EventMonitorWidget({super.key, required this.eventStream, required this.errorStream});

  final Stream<String> eventStream;
  final Stream<dynamic> errorStream;

  @override
  State<EventMonitorWidget> createState() => _EventMonitorWidgetState();
}

class _EventMonitorWidgetState extends State<EventMonitorWidget> {
  final _subscriptions = SubscriptionHolder();

  @override
  void initState() {
    super.initState();

    // Using .addTo() extension
    widget.eventStream.listen((event) {
      debugPrint('Received: $event');
    }).addTo(_subscriptions);

    // Using .add() directly
    _subscriptions.add(widget.errorStream.listen((err) {
      debugPrint('Error: $err');
    }));
  }

  @override
  void dispose() {
    _subscriptions.dispose(); // Cancels both subscriptions immediately
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
```

### 2. Using `SubscriptionHolderMixin` in StateNotifier / ChangeNotifier

```dart
import 'package:flutter/foundation.dart';
import 'package:subscription_holder/subscription_holder.dart';

class SessionController extends ChangeNotifier with SubscriptionHolderMixin {
  SessionController(Stream<bool> authStateStream, Stream<int> tickStream) {
    authStateStream.listen((isAuthenticated) {
      // Handle auth update
      notifyListeners();
    }).addTo(subscriptionHolder);

    tickStream.listen((tick) {
      // Handle timer tick
    }).addTo(subscriptionHolder);
  }

  @override
  void dispose() {
    disposeSubscriptions();
    super.dispose();
  }
}
```

## Common Pitfalls & Anti-Patterns

- ❌ **Anti-pattern**: Manually maintaining individual nullable `StreamSubscription? _sub1; StreamSubscription? _sub2;` variables and cancelling each in `dispose()`, which is error-prone and easily leads to memory leaks.
  - ✔️ **Correct**: Collect all subscriptions into `SubscriptionHolder` and dispose them together.
- ❌ **Anti-pattern**: Calling `add()` on a `SubscriptionHolder` that has already been disposed.
  - ✔️ **Correct**: Only register subscriptions during the active lifecycle of the component.
