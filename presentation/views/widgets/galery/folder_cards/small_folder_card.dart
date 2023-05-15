// ignore_for_file: must_be_immutable

import 'dart:ui' as ui;

import '../../../../../config/services/my_size.dart';
import '../../../../../domanin/entities/galery/big_content_card_entity.dart';
import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

import '../../../../providers/view/provider_theme.dart';
import '../../custom_avatar.dart';

class SmallFolderCard extends StatelessWidget {
  final BigCardEntity obj;
  final Widget? child;
  final Function? onTap;
  final Widget? baner;
  SmallFolderCard(
      {required this.obj, this.child, this.onTap, this.baner, super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        margin:
            obj.userName != "" ? EdgeInsets.only(bottom: arentir * 0.03) : null,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          boxShadow: ThemeP.of(context).shadows.all,
          borderRadius: BorderRadius.circular(arentir * 0.015),
          // border: Border.all(width: 1, color: const Color(0xff00C52B)),
        ),
        width: arentir * 0.285,
        // height: arentir * 0.95,
        child: Column(children: [
          Visibility(
              visible: obj.userName != "",
              child: buildTitle(obj.userImg, obj.userName)),
          baner ?? buildBaner(),
          buildBottom(
            obj.allCount,
            obj.allViewed,
            obj.allShaered,
            obj.name,
          ),
          // const Expanded(child: SizedBox()),
          Visibility(
            visible: child != null,
            child: child ?? const SizedBox(),
          ),
          // SizedBox()
        ]),
      ),
    );
  }

  Widget buildBaner() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            height: arentir * 0.16,
            width: arentir * 0.3,
            child: ShimmerImg(imageUrl: obj.banerImg)),
        Visibility(visible: obj.videoUrl != null, child: buildPlay),
      ],
    );
  }

  Widget get buildPlay {
    return Container(
      width: arentir * 0.08,
      height: arentir * 0.08,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(arentir * 0.05),
      ),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 20.0,
          sigmaY: 20.0,
        ),
        child: const Icon(Icons.play_arrow, color: Colors.white),
      ),
    );
  }

  Widget buildTitle(String imgUrl, String title) {
    return Padding(
      padding: EdgeInsets.all(arentir * 0.01),
      child: Row(
        children: [
          CustomAvatar(
            imgUrl: imgUrl,
            // bgColor: Colors.blue,
            radius: arentir * 0.06,
            borderWidth: 2,
          ),
          buildStar,
          Text(
            title,
            style: TextStyle(fontSize: arentir * 0.02),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Expanded(child: SizedBox()),
          // AllBtn(onTap: () {
          //   if (onTap != null) onTap!();
          // })
        ],
      ),
    );
  }

  Container get buildStar {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: const Color(0xffB47D3F),
          border: Border.all(color: const Color(0xffE2BD83), width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: const Icon(
        Icons.star,
        color: Color(0xffE2BD83),
        size: 9,
      ),
    );
  }

  Widget buildBottom(int imgCount, int viewed, int geriBildirim, String text) {
    return Padding(
      padding: EdgeInsets.all(arentir * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              buildIconNum(Icons.image_outlined, imgCount),
              buildIconNum(Icons.remove_red_eye_outlined, viewed),
            ],
          ),
          SizedBox(height: arentir * 0.02),
          Text(
            text,
            style: TextStyle(fontSize: arentir * 0.022),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget buildIconNum(IconData iconD, int num) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(
        iconD,
        size: arentir * 0.03,
        color: const Color(0xff747474),
      ),
      SizedBox(width: arentir * 0.005),
      Text(
        "$num",
        style:
            TextStyle(fontSize: arentir * 0.02, color: const Color(0xff747474)),
      ),
      SizedBox(width: arentir * 0.01),
    ]);
  }
}
