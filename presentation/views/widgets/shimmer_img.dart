import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/view/provider_theme.dart';

class ShimmerImg extends StatelessWidget {
  final String imageUrl;
  const ShimmerImg({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final themeColor = ThemeP.of(context).colors;
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
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
          child: Container(color: Colors.grey),
        );
      },
    );
  }
}
