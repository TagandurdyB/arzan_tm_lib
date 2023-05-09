import "dart:ui";

import "/domanin/entities/images/img_card_entity.dart";

import "/config/system_info/my_size.dart";
import "/presentation/views/widgets/shimmer_img.dart";
import "package:flutter/material.dart";

import "../../../providers/view/provider_theme.dart";

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
        children: objs.map((e) => buildContent(e)).toList(),
      ),
    );
  }

  Widget buildContent(ImgCardEntity obj) {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.symmetric(
          horizontal: arentir * 0.01, vertical: arentir * 0.02),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              height: arentir * 0.3,
              width: arentir * 0.276,
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
