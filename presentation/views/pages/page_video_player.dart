import '../../providers/data/provider_video.dart';
import '/config/services/my_orientation.dart';
import 'package:video_player/video_player.dart';

import '../widgets/galery/video_player_widget.dart';

import '/config/services/my_size.dart';

import '/domanin/entities/galery/big_content_card_entity.dart';

import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class VideoPlayerPage extends StatefulWidget {
  final BigCardEntity obj;
  const VideoPlayerPage({required this.obj, super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
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
    MyOrientation.setPortraitUp();
    control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MyOrientation.disableSystemUI;
    return ScaffoldNo(
      bgColor: Colors.black,
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
              const BackButton(color: Colors.white),
              Expanded(
                  child: Text(
                widget.obj.name,
                style: TextStyle(color: Colors.white, fontSize: arentir * 0.04),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
              buildLikeBtn,
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

  bool _isLiked = false;
  Widget get buildLikeBtn {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              setState(() => _isLiked = !_isLiked);
            },
            child: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            )),
        Text(
          "1500",
          style: TextStyle(color: Colors.white, fontSize: arentir * 0.04),
        ),
      ],
    );
  }
}