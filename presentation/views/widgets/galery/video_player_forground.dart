// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../config/services/my_size.dart';
import '../../../providers/data/provider_video.dart';

import 'dart:ui' as ui;

class VideoPlayerForground extends StatelessWidget {
  VideoPlayerController controller;
  VideoPlayerForground({required this.controller, super.key});

  // late BuildContext context;
  final double arentir = MySize.arentir;
  late VideoP providV;
  late VideoP providVdo;
  @override
  Widget build(BuildContext context) {
    providV = VideoP.of(context);
    providVdo = VideoP.of(context, listen: false);
    return Visibility(
      visible: providV.isForvardShow,
      child: Container(
          alignment: Alignment.center,
          color: Colors.black54,
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(child: buildPlayPause),
              Expanded(child: buildBottom)
            ],
          )),
    );
  }

  Widget get buildPlayPause {
    return GestureDetector(
      onTap: _funcPlayPause,
      child: Icon(
        providV.isPlayed ? Icons.play_arrow : Icons.pause,
        color: Colors.white,
        size: arentir * 0.15,
      ),
    );
  }

  Widget get buildPlayPause1 {
    return GestureDetector(
      onTap: _funcPlayPause,
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
            providV.isPlayed ? Icons.play_arrow : Icons.pause,
            color: Colors.white,
            size: arentir * 0.15,
          ),
        ),
      ),
    );
  }

  void _funcPlayPause() {
    if (controller.value.isPlaying) {
      controller.pause();
      providVdo.changePlayPause(true);
    } else {
      controller.play();
      providVdo.changePlayPause(false);
    }
  }

  Widget get buildBottom {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        buildBottomGadgets,
        buildIndicator,
        SizedBox(height: arentir * 0.1),
      ]),
    );
  }

  Widget get buildBottomGadgets {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        GestureDetector(
            onTap: () {
              providVdo.tongleScreenMode;
            },
            child: Icon(
              providV.isPortrade
                  ? Icons.fullscreen
                  : Icons.screen_rotation_sharp,
              color: Colors.white,
            )),
      ],
    );
  }

  Widget get buildIndicator {
    return SizedBox(
      height: arentir * 0.02,
      child: VideoProgressIndicator(
        controller,
        allowScrubbing: true,
        colors: const VideoProgressColors(
            playedColor: Colors.white, bufferedColor: Colors.black54),
      ),
    );
  }
}
