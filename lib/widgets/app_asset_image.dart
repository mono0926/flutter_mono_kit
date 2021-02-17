import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppAssetImageType {
  png,
  svg,
}

abstract class AppAssetImage extends StatelessWidget {
  const factory AppAssetImage.png({
    Key? key,
    required String name,
    BoxFit? fit,
    double scale,
    Color? color,
  }) = _PngImage;
  const factory AppAssetImage.svg({
    required String name,
    BoxFit fit,
    Color? color,
  }) = _SvgImage;

  const AppAssetImage._({
    Key? key,
    required this.name,
    @required this.fit,
    required this.scale,
    required this.type,
    required this.color,
  }) : super(key: key);

  final String name;
  final BoxFit? fit;
  final double? scale;
  final AppAssetImageType? type;
  final Color? color;

  ImageProvider? get image =>
      this is _PngImage ? (this as _PngImage)._image : null;
}

class _PngImage extends AppAssetImage {
  const _PngImage({
    Key? key,
    required String name,
    BoxFit? fit,
    double scale = 3,
    Color? color,
  }) : super._(
          key: key,
          name: name,
          fit: fit,
          scale: scale,
          type: AppAssetImageType.png,
          color: color,
        );

  Image get _widget => Image.asset(
        'assets/images/$name.png',
        scale: scale,
        fit: fit,
        color: color,
      );

  ImageProvider get _image => _widget.image;

  @override
  Widget build(BuildContext context) => _widget;
}

class _SvgImage extends AppAssetImage {
  const _SvgImage({
    Key? key,
    required String name,
    BoxFit fit = BoxFit.contain,
    Color? color,
  }) : super._(
          key: key,
          name: name,
          fit: fit,
          scale: null,
          type: AppAssetImageType.svg,
          color: color,
        );

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/$name.svg',
      fit: fit ?? BoxFit.contain,
      color: color,
    );
  }
}
