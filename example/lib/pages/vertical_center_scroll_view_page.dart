import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class VerticalCenterScrollViewPage extends StatelessWidget {
  const VerticalCenterScrollViewPage({Key? key}) : super(key: key);

  static const routeName = '/VerticalCenterScrollView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(routeName),
      ),
      body: const VerticalCenterScrollView(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: UnfocusOnTap(
          child: Text('Vertical Center Scroll View'),
        ),
      ),
    );
  }
}
