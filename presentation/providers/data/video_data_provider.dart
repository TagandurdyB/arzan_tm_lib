import 'package:arzan/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../config/vars/constants.dart';
import '../../../domanin/entities/galery/video_entity.dart';

class VideoDataP extends ChangeNotifier {
//Swipe========================================================================
  PageController videoSpiveController = PageController(
    initialPage: 1,
    keepPage: true,
  );
  void startVideo(int page) {
    videoSpiveController.jumpToPage(page);
    _isNext = false;
    _isOld = false;
    notifyListeners();
  }

  bool _isNext = false, _isOld = false;
  bool get isNext => _isNext;
  bool get isOld => _isOld;

  //Video=========================================================
   VideoPlayerController? _controller;
  VideoPlayerController? get controller => _controller;
  // List<String> _videoUrls = [];
  set controller(VideoPlayerController? value) {
    _controller?.dispose();
    _controller = value;
    notifyListeners();
  }

    void play() {
    _controller?.play();
    notifyListeners();
  }

  void pause() {
    _controller?.pause();
    notifyListeners();
  }


  Future<void> initializeVideoPlayer(String videoUrl) async {
    final controller = VideoPlayerController.network(videoUrl);
    await controller.initialize();
    controller.setLooping(true);
    controller.play();
    this.controller = controller;
  }

//Previous============================================================================================

  // switchToNextVideo() {
  //   // _videoUrls.insert(0, _videoUrls.removeAt(_videoUrls.length - 1));
  //   initializeVideoPlayer(_videoUrls[2]).then((value) {
  //     if (_isNext) {
  //       _isNext = false;
  //       videoSpiveController.nextPage(
  //           duration: const Duration(milliseconds: 200),
  //           curve: Curves.easeInOut);
  //       notifyListeners();
  //     }
  //   });
  // }
//Next==============================================================================================
    switchToNextVideo() {
    // _videoUrls.insert(0, _videoUrls.removeAt(_videoUrls.length - 1));
    initializeVideoPlayer(_videoUrls[2]).then((value) {
      if (_isNext) {
        _isNext = false;
    
        notifyListeners();
      }
    });
  }
//=====================================================================================================


  void get dispodeVideo {
    _controller?.dispose();
    _controller = null;
    notifyListeners();
  }

  //================================================================

  void get svipeOld {
    if (_isNext) {
      _isNext = false;
    } else {
      _isOld = true;
    }
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (_isOld) {
        _isOld = false;
        if (obj.provious != null) {
          videoSpiveController
              .previousPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut)
              .then((value) => videoSpiveController.nextPage(
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.linear));
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void get svipeNext {
    if (_isOld) {
      _isOld = false;
    } else {
      _isNext = true;
    }
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (_isNext) {
        _isNext = false;
        if (obj.next != null) {
          videoSpiveController
              .nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut)
              .then((value) => videoSpiveController
                  .previousPage(
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.linear)
                  .then((value) {}));
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }

//=================================================================================
  VideoEntity obj = VideoEntity(
    title: "lo sdfsdfr sdf sdgsdy twer afzsdf g aszdgvzdsgfv zsdfcвп",
    videoUrl:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    likeCount: 14785,
    user: UserModel(
        id: 1, avatarImg: "", name: "100haryt.com", role: Role.Official),
    provious: 1,
    next: 3,
  );

    VideoEntity videoEntity = VideoEntity(
    title: "lo sdfsdfr sdf sdgsdy twer afzsdf g aszdgvzdsgfv zsdfcвп",
    videoUrl:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    likeCount: 14785,
    user: UserModel(
        id: 1, avatarImg: "", name: "100haryt.com", role: Role.Official),
    provious: 1,
    next: 3,
  );
//=================================================================================

  static VideoDataP of(BuildContext context, {bool listen = true}) =>
      Provider.of<VideoDataP>(context, listen: listen);
}
