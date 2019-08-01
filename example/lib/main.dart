import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

import 'app.dart';

void main() => runApp(
      RouteObserverProvider(
        child: App(),
      ),
    );
