import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class MaxWidthPaddingBuilderPage extends StatelessWidget {
  const MaxWidthPaddingBuilderPage({Key key}) : super(key: key);

  static const routeName = '/max_width_padding_builder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(routeName),
      ),
      body: MaxWidthPaddingBuilder(
        width: 300,
        builder: (context, padding) => ListView(
          padding: padding,
          children: List.filled(
            3,
            const Placeholder(),
          ),
        ),
      ),
    );
  }
}
