import 'package:shimmer/shimmer.dart';

import '../../providers/view/provider_theme.dart';
import '/presentation/views/pages/lotties/page_500.dart';
import 'package:flutter/material.dart';

class CustomFuture extends StatelessWidget {
  final Future<Object?>? future;
  final Function builder;
  CustomFuture({required this.future, required this.builder, super.key});

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Error custom future:= ${snapshot.error}");
          return Page500();
        } else if (snapshot.hasData) {
          return builder(context, snapshot.data);
        } else {
          return Center(
            child: shimmer(),
          );
        }
      },
    );
  }

  Widget shimmer() {
    final themeColor = ThemeP.of(context).colors;
    return Shimmer.fromColors(
      baseColor: themeColor.shimmerBg,
      highlightColor: themeColor.shimmerLine,
      enabled: true,
      direction: ShimmerDirection.ltr,
      period: const Duration(seconds: 1),
      child: Container(
        color: Colors.grey,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
