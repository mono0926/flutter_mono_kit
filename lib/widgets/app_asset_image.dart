import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

enum AppAssetImageType() {
  png,
  svg,
}

sealed class const AppAssetImage._({
  super.key,
  required final String name,
  required final BoxFit? fit,
  required final double? scale,
  required final AppAssetImageType? type,
  required final Color? color,
}) extends StatelessWidget {
  const factory png({
    Key? key,
    required String name,
    BoxFit? fit,
    double scale,
    Color? color,
  }) = _PngImage;
  const factory svg({
    Key? key,
    required String name,
    BoxFit fit,
    Color? color,
  }) = _SvgImage;

  ImageProvider? get image => switch (this) {
    final _PngImage png => png._image,
    _SvgImage() => null,
  };
}

class const _PngImage({
  super.key,
  required super.name,
  super.fit,
  double super.scale = 3,
  super.color,
}) extends AppAssetImage {
  this
    : super._(
        type: AppAssetImageType.png,
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

class const _SvgImage({
  super.key,
  required super.name,
  BoxFit super.fit = BoxFit.contain,
  super.color,
}) extends AppAssetImage {
  this
    : super._(
        scale: null,
        type: AppAssetImageType.svg,
      );

  @override
  Widget build(BuildContext context) {
    final color = this.color;
    return SvgPicture.asset(
      'assets/images/$name.svg',
      fit: fit ?? BoxFit.contain,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
