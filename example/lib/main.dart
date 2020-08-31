import 'package:flutter/material.dart' hide Router;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
