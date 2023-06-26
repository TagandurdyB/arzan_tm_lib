// import '/config/services/video_service.dart';
// ignore_for_file: must_be_immutable

import 'package:arzan/presentation/providers/data/provider_acaunt.dart';
import 'package:arzan/presentation/providers/view/provider_navigation.dart';
import 'package:arzan/presentation/views/widgets/btns_group.dart';

import '../../../providers/data/video_data_provider.dart';
import '../like_effect_widget.dart';
import '/config/services/my_size.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'video_player_forground.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  VideoPlayerWidget({required this.controller, super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;

    return controller.value.isInitialized
        ? Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            // height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                buildVideo(),
                VideoPlayerForground(controller: controller),
                // const VideoLikeEff(),
                const LikeEffect(
                  bubbleCount: 75,
                  child: SizedBox(),
                ),
                Positioned(
                  right: 30,
                  bottom: arentir * 0.27,
                  child: LikeBtn(
                    onTap: (bool val) {
                      if (AcauntP.of(context, listen: false).isSing) {
                        if (val) VideoDataP.of(context, listen: false).playLike;
                      } else {
                        ProviderNav.of(context, listen: false).changeScreen(4);
                        Navigator.popUntil(context, (route) => route.isFirst);
                      }
                    },
                    likeCount: VideoDataP.of(context)
                        .videos![VideoDataP.of(context).pageIndex]
                        .likeCount,
                    textSize: arentir * 0.06,
                    iconSize: arentir * 0.07,
                    iconColor: const Color(0xffE50027),
                  ),
                  //  GestureDetector(
                  //   onTap: (){
                  //     VideoDataP.of(context, listen: false).playLike;
                  //   },
                  //   child: const Icon(Icons.favorite, size: 80,color:Colors.red),
                  // ),
                )
              ],
            ),
          )
        : Container(
            height: 200,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
  }

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));
}
