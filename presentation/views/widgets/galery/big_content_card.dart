// ignore_for_file: must_be_immutable

import 'dart:ui' as ui;

import '../../../providers/data/provider_video.dart';
import '../../pages/page_video_player.dart';
import '../../../../config/services/my_size.dart';
import '../../../../domanin/entities/galery/big_content_card_entity.dart';
import '/presentation/views/widgets/all_btn.dart';
import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

import '../../../providers/view/provider_theme.dart';
import '../custom_avatar.dart';

class BigContentCard extends StatelessWidget {
  final BigCardEntity obj;
  final Widget? child;
  final Function? allFunc;
  final Function? playTab;
  final Widget? baner;
  BigContentCard(
      {required this.obj,
      this.child,
      this.allFunc,
      this.playTab,
      this.baner,
      super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      margin:
          obj.userName != "" ? EdgeInsets.only(bottom: arentir * 0.03) : null,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          boxShadow: ThemeP.of(context).shadows.all,
          borderRadius: BorderRadius.circular(arentir * 0.02),
          border: Border.all(width: 1, color: const Color(0xff00C52B))),
      width: arentir * 0.9,
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
    );
  }

  Widget buildBaner() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            height: arentir * 0.3,
            width: arentir * 0.9,
            child: ShimmerImg(imageUrl: obj.banerImg)),
        Visibility(visible: obj.videoUrl != null, child: buildPlay),
      ],
    );
  }

  Widget get buildPlay {
    return GestureDetector(
      onTap: () {
        // if (playTab != null) playTab!();
        // VideoService(videoUrl: obj.videoUrl).create;
        VideoP.of(context, listen: false).cleanVideo;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPlayerPage(objs: [
                      BigCardEntity(
                          id: 2,
                          banerImg:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                          thumbinalImg:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                          videoUrl: "assets/video0.mp4",
                          allCount: 12,
                          allShaered: 720,
                          allViewed: 14756,
                          name:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                          isEmpty: false),
                      BigCardEntity(
                          id: 2,
                          banerImg:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                          thumbinalImg:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                          videoUrl: "assets/video1.mp4",
                          allCount: 12,
                          allShaered: 720,
                          allViewed: 14756,
                          name:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                          isEmpty: false),
                      BigCardEntity(
                          id: 2,
                          banerImg:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                          thumbinalImg:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                          videoUrl: "assets/video2.mp4",
                          allCount: 12,
                          allShaered: 720,
                          allViewed: 14756,
                          name:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                          isEmpty: false),
                      BigCardEntity(
                          id: 2,
                          banerImg:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                          thumbinalImg:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                          videoUrl: "assets/video3.mp4",
                          allCount: 12,
                          allShaered: 720,
                          allViewed: 14756,
                          name:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                          isEmpty: false),
                    ])));
      },
      child: Container(
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
      ),
    );
  }

  Widget buildTitle(String imgUrl, String title) {
    return Padding(
      padding: EdgeInsets.all(arentir * 0.02),
      child: Row(
        children: [
          CustomAvatar(
            imgUrl: imgUrl,
            // bgColor: Colors.blue,
            radius: arentir * 0.08,
            borderWidth: 2,
          ),
          buildStar,
          Text(title),
          const Expanded(child: SizedBox()),
          AllBtn(onTap: () {
            if (allFunc != null) allFunc!();
          })
        ],
      ),
    );
  }

  Container get buildStar {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color(0xffB47D3F),
          border: Border.all(color: const Color(0xffE2BD83), width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: const Icon(
        Icons.star,
        color: Color(0xffE2BD83),
        size: 15,
      ),
    );
  }

  Widget buildBottom(int imgCount, int viewed, int geriBildirim, String text) {
    return Padding(
      padding: EdgeInsets.all(arentir * 0.03),
      child: Column(
        children: [
          Row(
            children: [
              buildIconNum(Icons.image_outlined, imgCount),
              buildIconNum(Icons.remove_red_eye_outlined, viewed),
              buildIconNum(
                  Icons.switch_access_shortcut_add_rounded, geriBildirim),
            ],
          ),
          Text(
            text,
            style:
                TextStyle(height: arentir * 0.003, fontSize: arentir * 0.035),
            maxLines: 2,
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
        size: arentir * 0.04,
        color: const Color(0xff747474),
      ),
      SizedBox(width: arentir * 0.01),
      Text(
        "$num",
        style:
            TextStyle(fontSize: arentir * 0.03, color: const Color(0xff747474)),
      ),
      SizedBox(width: arentir * 0.03),
    ]);
  }
}
