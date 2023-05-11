import '/domanin/entities/carusel_entity.dart';

import '../../providers/view/provider_theme.dart';
import '../../../config/services/my_size.dart';
import '/presentation/views/widgets/shimmer_img.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCarusel extends StatelessWidget {
  final List<CaruselEntity> items;
  MyCarusel({
    required this.items,
    super.key});
  final double arentir = MySize.arentir;
  final double width = MySize.width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical:width*0.04),
      child: CarouselSlider(
        options: CarouselOptions(
          height: width * 0.35,
          aspectRatio: 221 / 126,
          viewportFraction: 0.6,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        ),
        items: items.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  clipBehavior: Clip.hardEdge,
                  width: width,
                  // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration:  BoxDecoration(
                    color: ThemeP.of(context).colors.shimmerBg,
                    borderRadius: BorderRadius.circular(width*0.02),
                  ),
                  child:  ShimmerImg(imageUrl: i.imageUrl,));
            },
          );
        }).toList(),
      ),
    );
  }
}
