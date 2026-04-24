import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;

  const CustomImage({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath.endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        height: height,
        width: width,
        fit: fit,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      );
    }

    if (imagePath.startsWith('http') || imagePath.startsWith('https')) {
      return Image.network(
        imagePath,
        height: height,
        width: width,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      );
    }

    return Image.asset(
      imagePath,
      height: height,
      width: width,
      fit: fit,
      color: color,
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
    );
  }
}
