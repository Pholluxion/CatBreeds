import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import 'package:cat_breed/core/widgets/placeholder.dart';

class UINetworkImage extends StatelessWidget {
  final String ref;
  final double width;
  final double height;
  final BoxFit fit;

  const UINetworkImage({
    required this.ref,
    required this.width,
    required this.height,
    required this.fit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: fit,
        imageUrl: ref,
        placeholder: (context, url) => Shimmer(
          gradient: const LinearGradient(
            colors: [Colors.white, Colors.black12],
          ),
          child: UIPlaceholder(width: width, height: height),
        ),
        errorWidget: (context, url, error) =>
            UIPlaceholder(width: width, height: height),
      ),
    );
  }
}
