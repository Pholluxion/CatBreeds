import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class UINetworkImage extends StatelessWidget {
  final String ref;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const UINetworkImage({
    super.key,
    required this.ref,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        imageUrl: ref,
        placeholder: (context, url) => Shimmer(
          gradient: LinearGradient(colors: [Colors.white, Colors.black12]),
          child: Image.asset(
            width: double.infinity,
            height: 300,
            'assets/images/placeholder.jpg',
            fit: BoxFit.cover,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          'assets/images/placeholder.jpg',
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
