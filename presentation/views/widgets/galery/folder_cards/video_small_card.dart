// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../../../../config/services/my_size.dart';
import '../../../../../config/vars/formater.dart';
import '../../../../../domanin/entities/galery/content_card_entity.dart';
import '../../shimmer_img.dart';

class VideoSmallCard extends StatelessWidget {
  final ContentCardEntity obj;
  final Widget? child;
  final Function? onTap;
  final Widget? baner;
  VideoSmallCard(
      {required this.obj, this.child, this.onTap, this.baner, super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context=context;
    return buildVideoCard();
  }

    Widget buildVideoCard() {
    return GestureDetector(
      onTap: (){
        if(onTap!=null)onTap!();
      },
      // onTap: () => Navigator.push(context,
      //     MaterialPageRoute(builder: (context) =>  PageVidePlayer1(initId: obj.id))),
      
          // MaterialPageRoute(builder: (context) => const VideoPlayerPage())),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: arentir*0.01),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        // margin: const EdgeInsets.all(2),
        width: arentir * 0.29,
        height: arentir * 0.31,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: arentir * 0.29,
              height: arentir * 0.31,
              child: ShimmerImg(
                  fit: BoxFit.fitHeight, imageUrl: obj.banerImg),
            ),
            buildPlay,
            Positioned(
              bottom: arentir * 0.01,
              left: arentir * 0.02,
              child: Visibility(
                  visible: obj.viewed > 0,
                  child: buildIconView(obj.viewed)),
            ),
          ],
        ),
      ),
    );
  }

  Widget get buildPlay {
    return Container(
      width: arentir * 0.1,
      height: arentir * 0.1,
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

  Widget buildIconView(int vieved) => Row(
        children: [
          Icon(
            Icons.remove_red_eye_outlined,
            size: arentir * 0.03,
            color: Colors.white,
          ),
          Text(Formater.rounder(vieved),
              style: TextStyle(color: Colors.white, fontSize: arentir * 0.025)),
        ],
      );
}