import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveIcon extends StatelessWidget {
  const AdaptiveIcon(
    this.icon, {
    Key? key,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(_icon);
  }

  IconData get _icon {
    if (Platform.isIOS) {
      // TODO(mono): Support more icons
      if (icon == Icons.share) {
        return CupertinoIcons.share;
      }
    }
    // fallback: Material
    return icon;
  }
}
