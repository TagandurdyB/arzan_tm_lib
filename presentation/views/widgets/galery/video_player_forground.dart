// ignore_for_file: must_be_immutable

import 'package:arzan/presentation/providers/data/video_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../config/services/my_size.dart';
import '../../../../config/vars/formater.dart';
import '../../../providers/view/provider_video.dart';

import '../read_more_text.dart';

class VideoPlayerForground extends StatelessWidget {
  VideoPlayerController controller;
  VideoPlayerForground({required this.controller, super.key});

  // late BuildContext context;
  final double arentir = MySize.arentir;
  late VideoP providV;
  late VideoP providVdo;
  late VideoDataP videoP;

  @override
  Widget build(BuildContext context) {
    videoP = VideoDataP.of(context);
    providV = VideoP.of(context);
    providVdo = VideoP.of(context, listen: false);
    return Visibility(
      visible: providV.isForvardShow,
      child: GestureDetector(
        onDoubleTap: () => providVdo.forvordHidden,
        onTap: _funcPlayPause,
        child: Container(
            alignment: Alignment.center,
            color: Colors.black54,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // const Expanded(child: SizedBox()),
                buildPlayPause,
                buildBottom
              ],
            )),
      ),
    );
  }

  Widget get buildPlayPause {
    return GestureDetector(
      onTap: _funcPlayPause,
      child: Container(
        color:Colors.transparent,
        padding: const EdgeInsets.all(50),
        child: Icon(
          providV.isPlayed ? Icons.play_arrow : Icons.pause,
          color: Colors.white,
          size: arentir * 0.15,
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
        Align(alignment: Alignment.centerLeft, child: buildTitle),
        buildBottomGadgets,
        buildIndicator,
        SizedBox(height: arentir * 0.02),
        buildTimer,
        // SizedBox(height: arentir * 0.1),
      ]),
    );
  }

  Widget get buildTitle {
    return Container(
      padding: const EdgeInsets.all(8),
      width: arentir * 0.6,
      child: ReadMoreText(
        duration: const Duration(milliseconds: 300),
        text: videoP.videos![videoP.videoIndex].title,
        // '''Видео для вдохновения враолывлоалфыщышвойтоатоыдлфыварывапирыв Видео для вдохновения враолывлоалфыщышвойтоатоыдлфыварывапирыв Видео для вдохновения враолывлоалфыщышвойтоатоыдлфыварывапирыв''',
      ),
      // const Text(
      //   style:
      //       TextStyle(color: Colors.white, overflow: TextOverflow.ellipsis),
      //   maxLines: 3,
      // ),
    );
  }

  Widget get buildBottomGadgets {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
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
          const Expanded(child: SizedBox()),
          // LikeBtn(
          //   onTap: (bool val) {},
          //   textSize: arentir * 0.05,
          //   iconSize: 21,
          //   likeCount: 1500,
          // ),
        ],
      ),
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

  Widget get buildTimer {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      // Text(
      //   TimeConterter(controller).getPosition,
      //   style: const TextStyle(color: Colors.white),
      // ),
      Text(
        TimeConterter(controller).getDuration,
        style: const TextStyle(color: Colors.white),
      ),
    ]);
  }
}
