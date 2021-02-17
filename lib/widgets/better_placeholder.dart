import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BetterPlaceholder extends StatelessWidget {
  const BetterPlaceholder({
    Key? key,
    this.color = const Color(0xFF455A64), // Blue Grey 700
    this.strokeWidth = 2.0,
    this.fallbackWidth = 400.0,
    this.fallbackHeight = 400.0,
  }) : super(key: key);

  final Color color;
  final double strokeWidth;
  final double fallbackWidth;
  final double fallbackHeight;

  String _sizeDesc(BoxConstraints constraints) {
    final fallbackSize = 'Fallback Size: $fallbackWidth x $fallbackHeight';
    return '$fallbackSize\nReal Size: ${_fallbackIfInfinity(
      value: constraints.maxWidth,
      fallback: fallbackWidth,
    )} x ${_fallbackIfInfinity(
      value: constraints.maxHeight,
      fallback: fallbackHeight,
    )}';
  }

  double _fallbackIfInfinity({
    required double value,
    required double fallback,
  }) =>
      value == double.infinity ? fallback : value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Placeholder(
            color: color,
            strokeWidth: strokeWidth,
            fallbackWidth: fallbackWidth,
            fallbackHeight: fallbackHeight,
          ),
          Positioned.fill(
            child: Center(
              child: Card(
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text('${_sizeDesc(constraints)}'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
