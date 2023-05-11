import 'dart:ui';

import '../../../../config/services/my_size.dart';
import '../../../../domanin/entities/galery/img_card_entity.dart';
import 'package:flutter/material.dart';

import '../shimmer_img.dart';

class ImageCard extends StatelessWidget {
  final double? width;
  final double? height;
  final ImgCardEntity obj;
  final Function? onTab;
  ImageCard(
      {required this.obj, this.width, this.height, this.onTab, super.key});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return buildContent(obj);
  }

  Widget buildContent(ImgCardEntity obj) {
    return GestureDetector(
      onTap: () {
        if (onTab != null) onTab!(obj);
      },
      child: Container(
        // color: Colors.red,
        margin: EdgeInsets.symmetric(
            horizontal: arentir * 0.01, vertical: arentir * 0.02),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                height: height ?? arentir * 0.3,
                width: width ?? arentir * 0.276,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(arentir * 0.02)),
                child: ShimmerImg(fit: BoxFit.fitHeight, imageUrl: obj.img)),
            Positioned(
              left: arentir * 0.01,
              bottom: arentir * 0.03,
              child: buildBluredIconText(
                  Icons.visibility_outlined, Colors.white, "${obj.viewed}"),
            ),
            Positioned(
              right: arentir * 0.01,
              bottom: arentir * 0.03,
              child: buildBluredIconText(
                  Icons.favorite, const Color(0xffE50027), "${obj.liked}"),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBluredIconText(IconData iconD, Color col, String text) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        // color: Colors.orange,
        borderRadius: BorderRadius.circular(arentir * 0.01),
      ),
      padding: EdgeInsets.all(arentir * 0.005),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconD,
              color: col,
              size: arentir * 0.03,
            ),
            SizedBox(width: arentir * 0.01),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: arentir * 0.025),
            )
          ],
        ),
      ),
    );
  }
}
