import 'package:arzan/presentation/providers/data/provider_acaunt.dart';
import 'package:arzan/presentation/providers/view/provider_navigation.dart';
import 'package:provider/provider.dart';

import '../../providers/view/provider_video.dart';
import '../widgets/custom_avatar.dart';
import '../widgets/galery/video_player_widget.dart';
import '../widgets/next_btn.dart';
import '/presentation/providers/data/video_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../config/services/my_orientation.dart';
import '../../../config/services/my_size.dart';

class PageVidePlayer1 extends StatefulWidget {
  const PageVidePlayer1({super.key});

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
      videoDo = VideoDataP.of(context, listen: false);
      videoDo.initVideo();
      // VideoDataP.of(context, listen: false).initializeVideoPlayer(
      //     // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      //     // "http://95.85.126.113:8080/static/video/f7a6a57195e8e6ffd372b072794fddf1.mp4",
      //     );
    });
  }

  @override
  void dispose() {
    MyOrientation.setPortraitUp();
    //  VideoDataP.of(context, listen: false).dispodeVideo;
    videoDo.dispodeVideo;
    super.dispose();
  }

  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    videoDo = VideoDataP.of(context, listen: false);
    videoP = VideoDataP.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: videoP.videoSpiveController,
        scrollDirection: Axis.vertical,
        itemCount: VideoDataP.of(context).videos!.length,
        itemBuilder: (context, index) {
          return buildTest(index);
        },
        // children: List.generate(VideoDataP.of(context).videos!.length, (index) => buildTest(index))
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
              videoDo.svipeNext(context);
            } else {
              //yokardan asak
              //old video
              videoDo.svipeOld(context);
            }
          }
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLoad(true, index),
          // Container(color: Colors.white, child: Text("Index:=$index  videoIndex:=${VideoDataP.of(context).videoIndex}")),
          Expanded(
            child: GestureDetector(
              onTap: () {
                VideoP.of(context, listen: false).forvardShow;
              },
              child: Consumer<VideoDataP>(builder: (context, provider, child) {
                final controller = provider.getControlByIndex;
                if (controller != null && controller.value.isInitialized) {
                  return Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.black,
                    child: Stack(
                      children: [
                        VideoPlayerWidget(controller: controller),
                        buildTitle(index),
                      ],
                    ),
                    // child: index == 1
                    //     ? Stack(
                    //         children: [
                    //           VideoPlayerWidget(controller: controller),
                    //           buildTitle,
                    //         ],
                    //       )
                    //     : const SizedBox(),
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
          buildLoad(false, index),
        ],
      ),
    );
  }

  Widget buildTitle(index) {
    // final VideoDataP.of(context).videos
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
                // "https://play-lh.googleusercontent.com/326hZ9pubFetmymUcBe3ZX0gTG_DLdjiDdkleC04Gft-YtiJrBzGrQPNJGqghy6Nfg=w240-h480-rw",
                videoP.videos![index].user.avatarImg,
                // "100haryt.com",
                videoP.videos![index].user.name,
              )),

              Container(
                width: arentir * 0.2,
                margin: const EdgeInsets.all(8),
                child: NextBtn(
                  func: () {
                    if (!AcauntP.of(context, listen: false).isSing) {
                      ProviderNav.of(context, listen: false).changeScreen(4);
                      Navigator.popUntil(context, (route) => route.isFirst);
                    }else{
                      //Follow
                    }
                  },
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

  Widget buildLoad(bool isUp, int index) {
    // final obj = videoP.video;
    // final int videoIndex = videoP.videoIndex;
    final bool isLimit = isUp ? index == 0 : index == videoP.videos!.length - 1;
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
          : !isUp
              ? Material(
                  color: Colors.transparent,
                  child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 70,
                      child: const Text(
                        // index == 0 ? "First Video" :
                        "Last Video",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )))
              : const SizedBox(),
      secondChild: const SizedBox(),
      crossFadeState: (isUp ? videoP.isOld : videoP.isNext)
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
