import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/color_manager.dart';
import '../../../utils/values_manager.dart';


class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  final String? imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return  const Center(
        child: Icon(
          Icons.error_outline,
          color: ColorManager.error,
          size: AppSize.s40,
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          color: ColorManager.white,
          strokeWidth: AppSize.s1,
          strokeCap: StrokeCap.round,
        ),
      ),
      errorWidget: (context, url, error) =>
      const Icon(Icons.error_outline, color: Colors.red),
    );
  }
}