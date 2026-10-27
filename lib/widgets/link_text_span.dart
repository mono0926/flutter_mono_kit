import 'package:flutter/gestures.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: prefer_const_constructors_in_immutables
class LinkTextSpan({
  required TextStyle style,
  required Uri url,
  String? text,
}) extends TextSpan {
  this
    : super(
        style: style,
        text: '${text ?? url}',
        recognizer: TapGestureRecognizer()..onTap = () => launchUrl(url),
      );
}
