import '/config/themes/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
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
    if (imageUrl == "") {
      return buildError();
    } else {
      return buildCacher(themeColor);
    }
  }

  CachedNetworkImage buildCacher(ColorsLight themeColor) {
    return CachedNetworkImage(
      fadeInCurve: Curves.easeInOut,
      fit: fit,
      imageUrl: imageUrl,
      cacheManager: CacheManager(Config("images",
          stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 500)),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: themeColor.shimmerBg,
        highlightColor: themeColor.shimmerLine,
        enabled: true,
        direction: ShimmerDirection.ltr,
        period: const Duration(seconds: 1),
        child: child ?? Container(color: Colors.grey),
      ),
      errorWidget: (context, url, error) => buildError(),
      // imageBuilder: ,
    );
  }

  Container buildError() {
    return Container(
        color: Colors.black12,
        alignment: Alignment.center,
        child: Image.asset("assets/logo_png.png"));
  }
}
