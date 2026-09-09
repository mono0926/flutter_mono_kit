---
name: mono_kit-widgets
description: >-
  Use when utilizing mono_kit UI widgets, lifecycle observers, dialog helpers,
  or layout utilities in Flutter apps.
---

# mono_kit Flutter Utilities & Widgets Guide

`mono_kit` is an opinionated collection of practical Flutter UI widgets, lifecycle listeners, and extension utilities created to streamline daily Flutter development.

## Guidelines

- **BetterPlaceholder**:
  - Use `BetterPlaceholder` instead of Flutter's default `Placeholder` when wireframing or creating mock UI sections, providing customizable color schemes, labels, and borders.
- **UnfocusOnTap**:
  - Wrap page roots or scroll views with `UnfocusOnTap` to dismiss the soft keyboard automatically whenever the user taps outside text fields.
- **LifecycleObserver**:
  - Use `LifecycleObserver` to observe `AppLifecycleState` transitions (resumed, paused, detached) with clean callback functions rather than manually implementing `WidgetsBindingObserver`.
- **Extension Helpers**:
  - Utilize context extensions (e.g. `context.theme`, `context.mediaQuery`, `context.colorScheme`) and collection/string extensions provided by `mono_kit`.

## Examples

### 1. Dismissing Keyboard with `UnfocusOnTap`

```dart
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UnfocusOnTap(
      child: Scaffold(
        appBar: AppBar(title: const Text('Input Form')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            TextField(decoration: InputDecoration(labelText: 'Name')),
            SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'Email')),
          ],
        ),
      ),
    );
  }
}
```

### 2. App Lifecycle Observation

```dart
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class TrackedScreen extends StatefulWidget {
  const TrackedScreen({super.key});

  @override
  State<TrackedScreen> createState() => _TrackedScreenState();
}

class _TrackedScreenState extends State<TrackedScreen> {
  late final LifecycleObserver _lifecycleObserver;

  @override
  void initState() {
    super.initState();
    _lifecycleObserver = LifecycleObserver(
      onResume: () => debugPrint('App resumed: refreshing real-time feeds'),
      onPause: () => debugPrint('App paused: pausing background timers'),
    );
  }

  @override
  void dispose() {
    _lifecycleObserver.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Lifecycle Monitored')),
    );
  }
}
```

## Common Pitfalls & Anti-Patterns

- ❌ **Anti-pattern**: Forgetting to call `_lifecycleObserver.dispose()`, leaking global `WidgetsBindingObserver` callbacks.
  - ✔️ **Correct**: Always dispose `LifecycleObserver` within `State.dispose()`.
