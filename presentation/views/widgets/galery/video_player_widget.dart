// import '/config/services/video_service.dart';
// ignore_for_file: must_be_immutable

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
