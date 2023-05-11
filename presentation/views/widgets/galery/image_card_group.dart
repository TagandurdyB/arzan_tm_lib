import '../../../../domanin/entities/galery/img_card_entity.dart';

import '../../../../config/services/my_size.dart';
import "package:flutter/material.dart";

import '../../../providers/view/provider_theme.dart';
import "image_card.dart";

class ImageCardGroup extends StatelessWidget {
  final List<ImgCardEntity> objs;
  final double? height;
  ImageCardGroup({super.key, this.height, required this.objs});
  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          boxShadow: ThemeP.of(context).shadows.all,
          borderRadius: BorderRadius.circular(arentir * 0.02),
          border: Border.all(width: 1, color: const Color(0xff00C52B))),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: objs.map((e) => ImageCard(obj: e)).toList(),
      ),
    );
  }
}
