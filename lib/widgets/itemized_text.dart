import 'package:flutter/material.dart';

export 'link_text_span.dart';

class ItemizedText extends StatelessWidget {
  const ItemizedText(
    this.texts, {
    super.key,
    this.bullet = '・',
  });

  final List<Text> texts;
  final String bullet;

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

class _ItemizedTextRow extends StatelessWidget {
  const _ItemizedTextRow(
    this.text, {
    required this.bullet,
  });

  final Text text;
  final String bullet;

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
