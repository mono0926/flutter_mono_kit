import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ListenerText extends StatelessWidget {
  const ListenerText(
    this.data, {
    Key key,
    this.style,
  }) : super(key: key);

  final ValueListenable<String> data;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: data,
      builder: (_context, data, _child) {
        return Text(
          data,
          style: style,
        );
      },
    );
  }
}
