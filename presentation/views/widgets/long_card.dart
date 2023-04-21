// ignore_for_file: must_be_immutable

import 'package:arzan_tm/config/system_info/my_size.dart';
import 'package:arzan_tm/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

import '../../providers/view/provider_theme.dart';
import 'card_title.dart';

class LongCard extends StatelessWidget {
  final String title;
  final int counter;
  final String imageUrl;
  LongCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.counter});

  late BuildContext context;

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Column(
      children: [
        CardTitle(counter: counter, title: title),
        buildCard,
      ],
    );
  }

  Widget get buildCard {
    return ClipRRect(
      borderRadius: BorderRadius.circular(arentir * 0.02),
      child: Container(
        color: ThemeP.of(context).colors.shimmerBg,
        width: double.infinity,
        height: arentir * 0.3,
        child: ShimmerImg(imageUrl: imageUrl),
      ),
    );
  }
}
