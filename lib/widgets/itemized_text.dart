import 'package:flutter/material.dart';

export 'link_text_span.dart';

class ItemizedText extends StatelessWidget {
  const ItemizedText(
    this.texts, {
    Key? key,
    this.bullet = '・',
  }) : super(key: key);

  final List<Text> texts;
  final String bullet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: texts
          .map(
            (text) => _ItemizedTextRow(
              text,
              bullet: bullet,
            ),
          )
          .toList(),
    );
  }
}

class _ItemizedTextRow extends StatelessWidget {
  const _ItemizedTextRow(
    this.text, {
    Key? key,
    required this.bullet,
  }) : super(key: key);

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
