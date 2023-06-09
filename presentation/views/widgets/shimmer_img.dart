import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/view/provider_theme.dart';

class ShimmerImg extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final Widget? child;
  const ShimmerImg(
      {super.key, required this.imageUrl, this.child, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    final themeColor = ThemeP.of(context).colors;
    return Image.network(
      imageUrl,
      fit: fit,
      loadingBuilder: (context, child, placeholder) {
        if (placeholder == null) return child;
        return Container(color: Colors.grey);
      },
      errorBuilder: (context, obj, stack) {
        return Shimmer.fromColors(
          baseColor: themeColor.shimmerBg,
          highlightColor: themeColor.shimmerLine,
          enabled: true,
          direction: ShimmerDirection.ltr,
          period: const Duration(seconds: 1),
          child: child ?? Container(color: Colors.grey),
        );
      },
    );
  }
}
