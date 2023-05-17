import '../../providers/view/provider_video.dart';
import '../widgets/btns_group.dart';
import '/config/services/my_orientation.dart';
import 'package:video_player/video_player.dart';

import '../widgets/galery/video_player_widget.dart';

import '/config/services/my_size.dart';

import '/domanin/entities/galery/big_content_card_entity.dart';

import 'package:flutter/material.dart';

class VideoPlayerPage extends StatefulWidget {
  final List<BigCardEntity> objs;
  const VideoPlayerPage({required this.objs, super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  @override
  void initState() {
    super.initState();
    MyOrientation.disableSystemUI;
  }

  @override
  void dispose() {
    MyOrientation.setPortraitUp();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      onPageChanged: (value) => VideoP.of(context, listen: false).svipeVideo,
      children: widget.objs.map((e) => CustomVideoPlayer(obj: e)).toList(),
      // children: [CustomVideoPlayer(obj: ,)],
    );
  }
}

class CustomVideoPlayer extends StatefulWidget {
  final BigCardEntity obj;
  const CustomVideoPlayer({required this.obj, super.key});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  final double arentir = MySize.arentir;
  late VideoPlayerController control;

  @override
  void initState() {
    control = VideoPlayerController.asset(widget.obj.videoUrl!)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => control.play());
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   final providV = VideoP.of(context, listen: false);
    //   providV.startVideo(() => setState(() {}));
    //   providV.looping;
    // });
    super.initState();
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   VideoP.of(context, listen: false).cancelVideo;
    // });
    // MyOrientation.enableNavigationBar;

    control.dispose();
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
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // CustomAppBar(title: obj.name),
              VideoPlayerWidget(controller: control),
              buildTitle,
            ],
          ),
        ),
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
                  child: Text(
                widget.obj.name,
                style: TextStyle(color: Colors.white, fontSize: arentir * 0.04),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
              LikeBtn(
                onTap: (bool val) {},
                textSize: arentir * 0.04,
                iconSize: 20,
                likeCount: 1500,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.file_download,
                    color: Colors.white,
                  ))
            ],
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
