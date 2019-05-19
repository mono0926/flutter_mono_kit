import 'package:flutter/material.dart';

import 'cell.dart';
import 'data.dart';

class OverflowDetectableTextPage extends StatelessWidget {
  const OverflowDetectableTextPage();

  static const routeName = '/OverflowDetectableText';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(routeName),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(height: 0),
        itemBuilder: (context, index) => Cell(Data.index(index)),
      ),
    );
  }
}
