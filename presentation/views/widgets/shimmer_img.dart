// ignore_for_file: must_be_immutable

import 'dart:io';

import '/config/themes/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/view/provider_theme.dart';

enum ImageType { assets, file, network }

class ShimmerImg extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final ImageType type;
  final Widget? child;
  ShimmerImg(
      {super.key,
      required this.imageUrl,
      this.type = ImageType.network,
      this.child,
      this.fit = BoxFit.cover});

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    if (imageUrl == "") {
      return buildError();
    } else {
      return buildCacher();
    }
  }

  Widget buildCacher() {
    if (type == ImageType.network) {
      return CachedNetworkImage(
        fadeInCurve: Curves.easeInOut,
        fit: fit,
        imageUrl: imageUrl,
        cacheManager: CacheManager(Config("images",
            stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 500)),
        // progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        //     child: CircularProgressIndicator(value: downloadProgress.progress)),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            shimmer(downloadProgress),
        errorWidget: (context, url, error) => buildError(),
        // imageBuilder: ,
      );
    } else if (type == ImageType.file) {
      return Image.file(File(imageUrl), fit: fit);
    } else {
      return buildError();
    }
  }

  Widget shimmer(downloadProgress) {
    final themeColor = ThemeP.of(context).colors;
    return Shimmer.fromColors(
      baseColor: themeColor.shimmerBg,
      highlightColor: themeColor.shimmerLine,
      enabled: true,
      direction: ShimmerDirection.ltr,
      period: const Duration(seconds: 1),
      child: child ??
          Container(
            color: Colors.grey,
            alignment: Alignment.center,
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
    );
  }

  Container buildError() {
    return Container(
        color: Colors.black12,
        alignment: Alignment.center,
        child: Image.asset("assets/logo_png.png"));
  }
}
