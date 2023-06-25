import 'package:arzan/config/services/my_size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../config/services/my_orientation.dart';
import '../../../domanin/entities/galery/content_card_entity.dart';
import '../../providers/data/video_data_provider.dart';
import '../../providers/view/provider_video.dart';
import '../widgets/custom_avatar.dart';
import '../widgets/galery/video_player_widget.dart';
import '../widgets/next_btn.dart';

class VideoPlayer2 extends StatefulWidget {
  const VideoPlayer2({super.key});

  @override
  State<VideoPlayer2> createState() => _VideoPlayer2State();
}

class _VideoPlayer2State extends State<VideoPlayer2> {
  late VideoDataP videoP;

  @override
  void initState() {
    MyOrientation.disableSystemUI;
    super.initState();
  }

  @override
  void dispose() {
    MyOrientation.setPortraitUp();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    videoP = VideoDataP.of(context);

    final List<ContentCardEntity> videos = videoP.videos ?? [];
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: videoP.videoSpiveController,
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.red,
          child: Text("$index"));
      },
    );
  }
}

class VideoPlayScreen extends StatefulWidget {
  final int index;
  const VideoPlayScreen({required this.index, super.key});

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  late VideoDataP videoDo, videoP;
  final double arentir = MySize.arentir;
  int startY = 0, endY = 0;

// late VideoPlayerController control;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      VideoDataP.of(context, listen: false).initVideo;
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      VideoDataP.of(context, listen: false).dispodeVideo;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    videoDo = VideoDataP.of(context, listen: false);
    videoP = VideoDataP.of(context);
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
                  return Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.black,
                    child: widget.index == 1
                        ? Stack(
                            children: [
                              VideoPlayerWidget(controller: controller),
                              buildTitle,
                            ],
                          )
                        : const SizedBox(),
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

  Widget get buildTitle {
    return Visibility(
      visible: VideoP.of(context).isForvardShow,
      child: Column(
        children: [
          Row(
            children: [
              BackButton(
                  color: Colors.white,
                  onPressed: () {
                    VideoP.of(context, listen: false).cleanVideo;
                    Navigator.pop(context);
                  }),
              Expanded(
                  child: buildUser(
                "https://play-lh.googleusercontent.com/326hZ9pubFetmymUcBe3ZX0gTG_DLdjiDdkleC04Gft-YtiJrBzGrQPNJGqghy6Nfg=w240-h480-rw",
                "100haryt.com",
              )),

              Container(
                width: arentir * 0.2,
                margin: const EdgeInsets.all(8),
                child: NextBtn(
                  func: () {},
                  text: "Yzarla",
                ),
              )
              // IconButton(
              //     onPressed: () {},
              //     icon: const Icon(
              //       Icons.file_download,
              //       color: Colors.white,
              //     ))
            ],
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget buildUser(String imgUrl, String title) {
    return Padding(
      padding: EdgeInsets.all(arentir * 0.02),
      child: Row(
        children: [
          CustomAvatar(
            imgUrl: imgUrl,
            // bgColor: Colors.blue,
            radius: arentir * 0.1,
            borderWidth: 1,
          ),
          buildStar,
          Expanded(
            child: SizedBox(
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white, overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
            ),
          ),
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
        size: 13,
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
