// import '/config/services/video_service.dart';
// ignore_for_file: must_be_immutable

import 'package:arzan/presentation/providers/data/provider_acaunt.dart';
import 'package:arzan/presentation/views/widgets/btns_group.dart';
import 'package:lottie/lottie.dart';

import '../../../../domanin/entities/galery/content_card_entity.dart';
import '../../../providers/data/video_data_provider.dart';
import '../like_effect_widget.dart';
import '/config/services/my_size.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'video_player_forground.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  VideoPlayerWidget({required this.controller, super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    // return Consumer<VideoDataP>(builder: (context, provider, child) {
    // final controller = provider.controller;
    // final controller = provider.getControlByIndex;
    final videoDo = VideoDataP.of(context, listen: false);
    final videoP = VideoDataP.of(context);
    final obj = videoP.videos![videoP.pageIndex] as ContentCardEntity;
    return controller.value.isInitialized
        ? Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            // height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                buildVideoPlayer(),
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
                        if (val) {
                          videoDo.playLike;
                          videoDo.likeVidoe(obj.id);
                        }
                      } else {
                        // MyPopUpp.popLoading(context);
                        // MyPopUpp.popMessage(context, null, "Agza boluň!", true);

                        Fluttertoast.showToast(
                            msg: "Agza boluň!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        // videoDo.dispodeVideo;

                        // ProviderNav.of(context, listen: false).changeScreen(4);
                        // Navigator.popUntil(context, (route) => route.isFirst);
                      }
                    },
                    isWork: AcauntP.of(context, listen: false).isSing,
                    isLiked: obj.isLiked,
                    likeCount: obj.likeCount +
                        (videoP.likes[videoP.pageIndex] ? 1 : 0),
                    textSize: 16,
                    iconSize: 25,
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
        : Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              // color: Colors.red,
              child: Lottie.asset("assets/loading4.json",
                  reverse: true,
                  width: MySize.arentir * 0.2,
                  height: MySize.arentir * 0.2,
                  fit: BoxFit.fill),
            ),
          );
    // });
  }

  // Widget buildVideo(VideoPlayerController ) =>
  //     Consumer<VideoDataP>(builder: (context, provider, child) {
  //       final controller = provider.getControlByIndex;
  //       if (controller != null && controller.value.isInitialized) {
  //         return buildVideoPlayer();
  //       } else {
  //         return Align(
  //           alignment: Alignment.center,
  //           child: Container(
  //             margin: const EdgeInsets.only(bottom: 16),
  //             // color: Colors.red,
  //             child: Lottie.asset("assets/loading4.json",
  //                 reverse: true,
  //                 width: MySize.arentir * 0.2,
  //                 height: MySize.arentir * 0.2,
  //                 fit: BoxFit.fill),
  //           ),
  //         );
  //       }
  //     });

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));
}
