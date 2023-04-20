// ignore_for_file: must_be_immutable

import 'package:arzan_tm/config/system_info/my_size.dart';
import 'package:arzan_tm/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

import '../../providers/view/provider_theme.dart';

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
        buildTitle,
        buildCard,
      ],
    );
  }

  Container get buildTitle {
    return Container(
        padding: EdgeInsets.symmetric(vertical: arentir * 0.03),
        // color: Colors.red,
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: arentir * 0.04, fontWeight: FontWeight.bold),
            ),
            Text(
              " (+$counter)",
              style: TextStyle(
                  fontSize: arentir * 0.04,
                  color: const Color(0xff188A34),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  Widget get buildCard {
    return ClipRRect(
      borderRadius: BorderRadius.circular(arentir * 0.02),
      child: Container(
        color: ThemeP.of(context).colors.shimmerBg,
        width: double.infinity,
        height: arentir * 0.25,
        child: ShimmerImg(imageUrl: imageUrl),
      ),
    );
  }
}
