import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkTextSpan extends TextSpan {
  LinkTextSpan({
    required TextStyle style,
    required String url,
    String? text,
  }) : super(
          style: style,
          text: text ?? url,
          recognizer: TapGestureRecognizer()..onTap = () => launch(url),
        );
}
