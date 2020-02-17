import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppAssetImageType {
  png,
  svg,
}

class AppAssetImage extends StatelessWidget {
  const AppAssetImage({
    Key key,
    @required this.name,
    this.fit,
    this.scale = 3,
    this.type = AppAssetImageType.png,
  }) : super(key: key);

  final String name;
  final BoxFit fit;
  final double scale;
  final AppAssetImageType type;

  Widget get _widget {
    switch (type) {
      case AppAssetImageType.png:
        return assetImage;
      case AppAssetImageType.svg:
        return svgPicture;
    }
    assert(false, 'Unexpected type: $type');
    return null;
  }

  Image get assetImage => Image.asset(
        'assets/images/$name.png',
        scale: scale,
        fit: fit,
      );

  SvgPicture get svgPicture => SvgPicture.asset(
        'assets/images/$name.svg',
        fit: fit,
      );

  ImageProvider get image {
    switch (type) {
      case AppAssetImageType.png:
        return assetImage.image;
      case AppAssetImageType.svg:
        return null;
    }
    assert(false, 'Unexpected type: $type');
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return _widget;
  }
}
