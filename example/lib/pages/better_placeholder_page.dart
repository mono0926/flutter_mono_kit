import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class BetterPlaceholderPage extends StatelessWidget {
  const BetterPlaceholderPage({Key key}) : super(key: key);

  static const routeName = '/better_placeholder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(routeName),
      ),
      body: ListView(
        children: const [
          BetterPlaceholder(),
          BetterPlaceholder(
            fallbackWidth: 100,
            fallbackHeight: 200,
          ),
          BetterPlaceholder(
            fallbackHeight: 30,
          ),
        ],
      ),
    );
  }
}
