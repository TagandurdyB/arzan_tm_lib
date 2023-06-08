// ignore_for_file: must_be_immutable

import '../../../../config/services/my_size.dart';
import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

import '../../../providers/view/provider_theme.dart';
import '../card_title.dart';

class DoubleCard extends StatelessWidget {
  final String firstTitle;
  final int firstCounter;
  final String firstImageUrl;
  final String secondTitle;
  final int secondCounter;
  final String secondImageUrl;
  final Function? firstOnTab;
  final Function? secondOnTab;

  DoubleCard({
    super.key,
    required this.firstTitle,
    required this.firstCounter,
    required this.firstImageUrl,
    required this.secondTitle,
    required this.secondCounter,
    required this.secondImageUrl,
    this.firstOnTab,
    this.secondOnTab,
  });

  late BuildContext context;

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildCard(
                firstTitle, firstCounter, firstImageUrl, firstOnTab ?? () {}),
            buildCard(secondTitle, secondCounter, secondImageUrl,
                secondOnTab ?? () {}),
          ],
        ),
      ],
    );
  }

  Widget buildCard(String title, int count, String img, Function func) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardTitle(counter: count, title: title),
        GestureDetector(
          onTap: () => func(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(arentir * 0.02),
            child: Container(
              color: ThemeP.of(context).colors.shimmerBg,
              width: arentir * 0.45,
              height: arentir * 0.34,
              child: ShimmerImg(imageUrl: img),
            ),
          ),
        ),
      ],
    );
  }
}
