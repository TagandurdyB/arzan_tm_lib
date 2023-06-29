import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

import '../../../../config/services/my_size.dart';

class VideoPlayerView extends StatefulWidget {
  final String url;
  final DataSourceType dataType;
  const VideoPlayerView({required this.url, required this.dataType, super.key});

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    switch (widget.dataType) {
      case DataSourceType.asset:
        _videoController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoController = VideoPlayerController.network(widget.url,
            httpHeaders: {"Range": ""});
        break;
      case DataSourceType.file:
        _videoController = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.contentUri:
        _videoController =
            VideoPlayerController.contentUri(Uri.parse(widget.url));
        break;
    }

    _videoController
        .initialize()
        .then((value) => setState(() => _chewieController = ChewieController(
              videoPlayerController: _videoController,
              aspectRatio: _videoController.value.aspectRatio,
              autoPlay: true,
            )));

    // _chewieController = ChewieController(
    //   videoPlayerController: _videoController,
    //   // aspectRatio: 16 / 9,
    //   autoInitialize: true,
    //   aspectRatio: _videoController.value.aspectRatio,
    //   autoPlay: true,
    // );
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoController.value.isInitialized?
    Chewie(controller: _chewieController):
    Center(child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              // color: Colors.red,
              child: Lottie.asset("assets/loading4.json",
                  reverse: true,
                  width: MySize.arentir * 0.2,
                  height: MySize.arentir * 0.2,
                  fit: BoxFit.fill),
            ))
    ;
  }
}
