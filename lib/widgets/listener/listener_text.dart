import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class const ListenerText(
  final ValueListenable<String> data, {
  super.key,
  final TextStyle? style,
  final String nullValue = '',
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: data,
      builder: (context, data, child) {
        return Text(
          data ?? nullValue,
          style: style,
        );
      },
    );
  }
}
