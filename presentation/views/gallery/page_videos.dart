// ignore_for_file: must_be_immutable

import '../../../domanin/entities/galery/content_card_entity.dart';
import '/domanin/entities/galery/video_entity.dart';

import '/config/services/my_size.dart';
import '/presentation/views/scaffold/custom_app_bar.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import '/presentation/views/widgets/custom_avatar.dart';
import '/presentation/views/widgets/next_btn.dart';
import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../../../config/vars/formater.dart';
import 'page_video_player1.dart';

class VideosPage extends StatelessWidget {
  final List<VideoCardEntity> objs;
  final ContentCardEntity obj;
  VideosPage({required this.objs,required this.obj, super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(titleW: buildUserInfo),
        SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: buildContent())
      ],
    ));
  }

  final TextStyle countStyle = TextStyle(
      fontSize: MySize.arentir * 0.025, color: const Color(0xff646464));

  Widget get buildUserInfo => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAvatar(
            imgUrl: obj.user.avatarImg,
            radius: arentir * 0.09,
          ),
           SizedBox(width: arentir*0.02),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(obj.user.name,
                    style: TextStyle(fontSize: arentir * 0.04)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildCountIcon(Icons.supervised_user_circle_outlined),
                    Text(" Görenler: ${obj.viewed}  ",
                        style: countStyle),
                    buildCountIcon(Icons.ondemand_video),
                    Text(" Wideo sany: ${obj.allCount}", style: countStyle),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: arentir * 0.16,
            height: arentir * 0.08,
            child: NextBtn(func: () {}, text: "Yzarla"),
          )
        ],
      );

  Icon buildCountIcon(IconData iconD) =>
      Icon(iconD, size: arentir * 0.028, color: const Color(0xff646464));

  Widget buildContent() {
    return Wrap(
      spacing: arentir * 0.016,
      runSpacing: arentir * 0.015,
      children: List.generate(objs.length, (index) => buildVideoCard(index)),
    );
  }

  Widget buildVideoCard(int index) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const PageVidePlayer1())),
          // MaterialPageRoute(builder: (context) => const VideoPlayerPage())),
      child: Container(
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
                  fit: BoxFit.fitHeight, imageUrl: objs[index].thumbinalImg),
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
