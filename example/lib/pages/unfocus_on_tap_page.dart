import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:quiver/iterables.dart';

class UnfocusOnTapPage extends StatelessWidget {
  const UnfocusOnTapPage({Key key}) : super(key: key);

  static const routeName = '/unfocus_on_tap';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(routeName),
      ),
      body: UnfocusOnTap(
        child: Column(
          children: range(0, 3)
              .map(
                (_) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
