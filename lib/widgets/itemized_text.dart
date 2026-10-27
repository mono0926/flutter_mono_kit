import 'package:material_ui/material_ui.dart';

export 'link_text_span.dart';

class const ItemizedText(
  final List<Text> texts, {
  super.key,
  final String bullet = '・',
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final text in texts)
          _ItemizedTextRow(
            text,
            bullet: bullet,
          ),
      ],
    );
  }
}

class const _ItemizedTextRow(
  final Text text, {
  required final String bullet,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Text(
          bullet,
          style: text.style,
        ),
        Expanded(child: text),
      ],
    );
  }
}
