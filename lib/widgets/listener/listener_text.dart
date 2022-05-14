import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ListenerText extends StatelessWidget {
  const ListenerText(
    this.data, {
    super.key,
    this.style,
    this.nullValue = '',
  });

  final ValueListenable<String> data;
  final TextStyle? style;
  final String nullValue;

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
