import 'package:provider/provider.dart';

import '../../providers/view/provider_video.dart';
import '../widgets/galery/video_player_widget.dart';
import '/presentation/providers/data/video_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../config/services/my_orientation.dart';
import '../../../config/services/my_size.dart';

class PageVidePlayer1 extends StatefulWidget {
  final int initId;
  const PageVidePlayer1({super.key, required this.initId});

  @override
  State<PageVidePlayer1> createState() => _PageVidePlayer1State();
}

class _PageVidePlayer1State extends State<PageVidePlayer1> {
  late VideoDataP videoDo, videoP;
  @override
  void initState() {
    super.initState();
    MyOrientation.disableSystemUI;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // VideoDataP.of(context, listen: false).fillVideo(2);
      VideoDataP.of(context, listen: false).initializeVideoPlayer(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    });
  }

  @override
  void dispose() {
    MyOrientation.setPortraitUp();
    videoDo.dispodeVideo;
    super.dispose();
  }

  List<Color> colors = [
    Colors.red,
    Colors.black,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    videoDo = VideoDataP.of(context, listen: false);
    videoP = VideoDataP.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: videoP.videoSpiveController,
          scrollDirection: Axis.vertical,
          children: List.generate(3, (index) => buildTest(index))
          // itemCount: 3,
          // itemBuilder: (context, index) => buildTest(index),

          ),
    );
  }

  int startY = 0, endY = 0;
  Widget buildTest(int index) {
    return GestureDetector(
      onVerticalDragDown: (details) {
        startY = details.globalPosition.dy.round();
        print("vertical Drag down : $startY");
      },
      onVerticalDragUpdate: (details) {
        endY = details.globalPosition.dy.round();
      },
      onVerticalDragEnd: (details) {
        setState(() {
          final int drag = startY - endY;
          print("vertical Drag end : $drag");
          if (drag.abs() > 100) {
            if (drag > 0) {
              //asak yokary
              //next video
              videoDo.svipeNext;
            } else {
              //yokardan asak
              //old video
              videoDo.svipeOld;
            }
          }
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLoad(true),
          Expanded(
            child: GestureDetector(
              onTap: () {
                VideoP.of(context, listen: false).forvardShow;
              },
              child: Consumer<VideoDataP>(builder: (context, provider, child) {
                final controller = provider.controller;
                if (controller != null && controller.value.isInitialized) {
                  return Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      color: colors[index],
                      child: index == 1
                          ? VideoPlayerWidget(controller: controller)
                          : const SizedBox(),
                    ),
                  );
                } else {
                  return Align(
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
                }
              }),
            ),
          ),
          buildLoad(false),
        ],
      ),
    );
  }

  Widget buildLoad(bool isUp) {
    final obj = videoP.video;
    final bool isLimit = isUp ? obj.provious == null : obj.next == null;
    return AnimatedCrossFade(
      // visible: isUp ? videoP.isOld : videoP.isNext,
      duration: const Duration(microseconds: 300),
      firstChild: !isLimit
          ? Visibility(
              visible: isUp ? videoP.isOld : videoP.isNext,
              child: Lottie.asset("assets/loading4.json",
                  reverse: true,
                  width: MySize.arentir * 0.2,
                  height: MySize.arentir * 0.2,
                  fit: BoxFit.fill),
            )
          : Material(
              color: Colors.transparent,
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 70,
                  child: Text(
                    obj.next == null ? "Last" : "First",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ))),
      secondChild: const SizedBox(),
      crossFadeState: (isUp ? videoP.isOld : videoP.isNext)
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
