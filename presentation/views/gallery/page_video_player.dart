import '../../../config/vars/constants.dart';
import '../../../domanin/entities/user_entity.dart';
import '/domanin/entities/galery/video_entity.dart';

import '/presentation/views/widgets/next_btn.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../providers/data/provider_gallery.dart';
import '../../providers/view/provider_video.dart';
import '../widgets/custom_avatar.dart';
import '/config/services/my_orientation.dart';

import '../widgets/galery/video_player_widget.dart';

import '/config/services/my_size.dart';

import 'package:flutter/material.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late GalleryP videoP;

  @override
  void initState() {
    super.initState();
    videoP = GalleryP.of(context, listen: false);
    MyOrientation.disableSystemUI;
  }

  @override
  void dispose() {
    MyOrientation.setPortraitUp();
    videoP.dispodeVideo;
    super.dispose();
  }

  List<VideoEntity> objs = [
    VideoEntity(
       user: UserEntity(avatarImg: "", id: 1 , name: "100haryt", role: Role.Official),
      title:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
      videoUrl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      likeCount: 1456,
      provious: null,
      next: 2,
    ),
    VideoEntity(
       user: UserEntity(avatarImg: "", id: 1 , name: "100haryt", role: Role.Official),
      title:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
      videoUrl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      likeCount: 1456,
      provious: null,
      next: 2,
    ),
    VideoEntity(
       user: UserEntity(avatarImg: "", id: 1 , name: "100haryt", role: Role.Official),
      title:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
      videoUrl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      likeCount: 1456,
      provious: null,
      next: 2,
    ),
    VideoEntity(
       user: UserEntity(avatarImg: "", id: 1 , name: "100haryt", role: Role.Official),
      title:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
      videoUrl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      likeCount: 1456,
      provious: null,
      next: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: GalleryP.of(context).videoSpiveController,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      onPageChanged: (value) => VideoP.of(context, listen: false).svipeVideo,
      children: List.generate(objs.length, (index) {
        if (objs.length == index + 1) {
          return buildVideoSviper(
              objs[index], objs[index - 1].videoUrl, "", "Last");
        } else if (index == 0) {
          return buildVideoSviper(
              objs[index], "", objs[index + 1].videoUrl, "First");
        } else {
          return buildVideoSviper(
              objs[index],
              objs[index - 1].videoUrl,
              objs[index + 1].videoUrl,
              "");
        }
      }),
      // children: widget.objs.map((e) => buildVideoSviper(e)).toList(),
      // children: [CustomVideoPlayer(obj: ,)],
    );
  }

  int startY = 0, endY = 0;
  Widget buildVideoSviper(
      VideoEntity obj, String old, String next, String videoStatus) {
    final galeryP = GalleryP.of(context);
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
            final geleryPdo = GalleryP.of(context, listen: false);
            if (drag > 0) {
              //asak yokary
              //next video
              geleryPdo.svipeNext;
            } else {
              //yokardan asak
              //old video
              geleryPdo.svipeOld;
            }
          }
        });
      },
      child: Column(
        children: [
          buildLoading(galeryP.isOld, false, videoStatus),
          Expanded(
              child:
                  CustomVideoPlayer(obj: obj, oldVideo: old, nextVideo: next)),
          buildLoading(galeryP.isNext, true, videoStatus),
        ],
      ),
    );
  }
}

Widget buildLoading(bool isShow, bool isLast, String videoStatus) =>
    AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstChild: Container(
        margin: const EdgeInsets.only(bottom: 16),
        // color: Colors.red,
        child: (isLast && videoStatus == "Last") ||
                (!isLast && videoStatus == "First")
            ? buildText(videoStatus)
            : Lottie.asset("assets/loading4.json",
                reverse: true,
                width: MySize.arentir * 0.2,
                height: MySize.arentir * 0.2,
                fit: BoxFit.fill),
      ),
      secondChild: const SizedBox(),
      crossFadeState:
          isShow ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );

Widget buildText(String text) => SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Text("$text Video",
            style: TextStyle(
                color: Colors.white, fontSize: MySize.arentir * 0.05)),
      ),
    );

class CustomVideoPlayer extends StatefulWidget {
  final VideoEntity obj;
  final String oldVideo, nextVideo;
  const CustomVideoPlayer(
      {required this.obj, this.nextVideo = "", this.oldVideo = "", super.key});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  final double arentir = MySize.arentir;
  // late VideoPlayerController control;
  GalleryP? _controllerProvider;

  @override
  void initState() {
    // control = VideoPlayerController.network(widget.obj.videoUrl!)
    //   ..addListener(() => setState(() {}))
    //   ..setLooping(true)
    //   ..initialize().then((value) => control.play());
    //
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   final providV = VideoP.of(context, listen: false);
    //   providV.startVideo(() => setState(() {}));
    //   providV.looping;
    // });
    super.initState();
    _controllerProvider = GalleryP.of(context, listen: false);
    _controllerProvider?.setVideoUrls([
      widget.oldVideo,
      widget.obj.videoUrl,
      widget.nextVideo,
    ]);
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   VideoP.of(context, listen: false).cancelVideo;
    // });
    // MyOrientation.enableNavigationBar;

    // control.dispose();
    // _controllerProvider?.controller?.dispose();
    // controller.dispose();

    // _controllerProvider?.dispose();
    // _controllerProvider?.controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          VideoP.of(context, listen: false).forvardShow;
        },
        child: Consumer<GalleryP>(builder: (context, provider, child) {
          final controller = provider.controller;
          if (controller != null && controller.value.isInitialized) {
            return Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // CustomAppBar(title: obj.name),
                  VideoPlayerWidget(controller: controller),
                  buildTitle,
                ],
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
}
