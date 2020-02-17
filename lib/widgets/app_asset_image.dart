import 'package:flutter/material.dart';

class AppAssetImage extends StatelessWidget {
  const AppAssetImage({
    Key key,
    @required this.name,
    this.fit,
    this.scale = 3,
    this.extension = 'png',
  }) : super(key: key);

  final String name;
  final BoxFit fit;
  final double scale;
  final String extension;

  Image get _widget => Image.asset(
        'assets/images/$name.$extension',
        scale: scale,
        fit: fit,
      );

  ImageProvider get image => _widget.image;

  @override
  Widget build(BuildContext context) {
    return _widget;
  }
}
