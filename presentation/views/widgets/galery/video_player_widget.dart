// import '/config/services/video_service.dart';
// ignore_for_file: must_be_immutable

import '../../../providers/data/provider_video.dart';
import '/config/services/my_size.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'dart:ui' as ui;

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  VideoPlayerWidget({required this.controller, super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    final providV = VideoP.of(context);
    return controller.value.isInitialized
        ? Container(
            alignment: Alignment.center,
            width: MySize.width,
            height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                buildVideo(),
                Visibility(
                    visible: providV.isForvardShow, child: buildForground()),
              ],
            ),
          )
        : Container(
            height: 200,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
  }

  Widget buildVideo() => GestureDetector(
      onTap: () {
        VideoP.of(context, listen: false).forvardShow;
      },
      child: buildVideoPlayer());

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));

  Widget buildForground() => Container(
      alignment: Alignment.center,
      color: Colors.black54,
      child: buildPlayPause);

  Widget get buildPlayPause {
    return GestureDetector(
      onTap: () {
        final providV = VideoP.of(context, listen: false);
        if (controller.value.isPlaying) {
          controller.pause();
          providV.changePlayPause(true);
        } else {
          controller.play();
          providV.changePlayPause(false);
        }
      },
      child: Container(
        width: arentir * 0.2,
        height: arentir * 0.2,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(arentir * 1),
        ),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 50.0,
            sigmaY: 50.0,
          ),
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: arentir * 0.1,
          ),
        ),
      ),
    );
  }
}
