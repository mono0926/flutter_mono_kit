import 'package:material_ui/material_ui.dart';

class const BetterPlaceholder({
  super.key,
  final Color color = const Color(0xFF455A64), // Blue Grey 700
  final double strokeWidth = 2.0,
  final double fallbackWidth = 400.0,
  final double fallbackHeight = 400.0,
}) extends StatelessWidget {
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
  }) => value == double.infinity ? fallback : value;

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
                    child: Text(_sizeDesc(constraints)),
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
