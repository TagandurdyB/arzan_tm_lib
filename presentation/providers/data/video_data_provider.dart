import 'package:arzan/data/models/user_model.dart';
import 'package:arzan/domanin/entities/register/response_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../config/vars/constants.dart';
import '../../../domanin/entities/galery/content_card_entity.dart';
import '../../../domanin/entities/galery/video_entity.dart';
import '../../../domanin/usecases/gallery_case.dart';
import '../view/provider_video.dart';

class VideoDataP extends ChangeNotifier {
  final GalleryCase galleryCase;
  VideoDataP({required this.galleryCase});
//Swipe========================================================================
  PageController videoSpiveController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  void startVideo(int page) {
    videoSpiveController.dispose();
    videoSpiveController = PageController(
      initialPage: page,
      keepPage: true,
    );
    _isNext = false;
    _isOld = false;
    notifyListeners();
  }

  bool _isNext = false, _isOld = false;
  bool get isNext => _isNext;
  bool get isOld => _isOld;

  //Video=========================================================
  List<VideoPlayerController?> _videoControls = [];
  List<VideoPlayerController?> get videoControls => _videoControls;
  VideoPlayerController? get getControlByIndex => _videoControls[_videoIndex];
  set videoControlsFill(VideoPlayerController? value) {
    _videoControls[_videoIndex]?.dispose();
    _videoControls[_videoIndex] = value;
    // _isVideoActive = true;
    notifyListeners();
  }

  VideoPlayerController? _controller;
  VideoPlayerController? get controller => _controller;
  // List<String> _videoUrls = [];
  set controller(VideoPlayerController? value) {
    _controller?.dispose();
    _controller = value;
    // _isVideoActive = true;
    notifyListeners();
  }

  void play() {
    // _controller?.play();
    _videoControls[_videoIndex]?.play();
    notifyListeners();
  }

  void pause() {
    // _controller?.pause();
    _videoControls[_videoIndex]?.pause();
    notifyListeners();
  }

  Future<void> initVideo() async {
    print("video UR:=${videos![_videoIndex].videoUrl}");
    final controller = VideoPlayerController.network(
        videos![_videoIndex].videoUrl,
        httpHeaders: {"Range": ""});
    controller.httpHeaders;
    await controller.initialize();
    // controller.addListener(() => notifyListeners());
    controller.setLooping(true);
    controller.play();
    videoControlsFill = controller;

    // await initializeVideoPlayer("http://10.15.0.76:8081/video");
    // http://95.85.126.113:8080/static/video/f7a6a57195e8e6ffd372b072794fddf1.mp4

    // await initializeVideoPlayer(
    //     "https://tmcell.tm/static/media/banner_saz.db412718704aaabbb298.mp4");

    // await initializeVideoPlayer(
    // "http://95.85.126.113:8080/static/video/f7a6a57195e8e6ffd372b072794fddf1.mp4");
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
  // switchToNextVideo() {
  //   // _videoUrls.insert(0, _videoUrls.removeAt(_videoUrls.length - 1));
  //   if (video.next != null) {
  //     fillVideo(video.next!).then(
  //       (value) => initializeVideoPlayer(value.videoUrl).then((value) {
  //         if (_isNext) {
  //           _isNext = false;
  //           svipeNext;
  //           notifyListeners();
  //         }
  //       }),
  //     );
  //   }
  // }

//=====================================================================================================
  bool _isVideoActive = false;

  void get dispodeVideo {
    print("salamsmsakdasjkd dispise");
    // _controller?.dispose();
    _videoControls[_videoIndex]?.dispose();
    _isVideoActive = false;
    // _controller = null;
    _videoControls[_videoIndex] = null;
    notifyListeners();
  }

  //   void get dispodeVideo {
  //   print("salamsmsakdasjkd dispise");
  //   _controller?.dispose();
  //   _isVideoActive = false;
  //   _controller = null;
  //   notifyListeners();
  // }

  //================================================================

  Future<VideoPlayerController> initSvipeVideo(String videoUrl) async {
    final controller =
        VideoPlayerController.network(videoUrl, httpHeaders: {"Range": ""});
    await controller.initialize().then((value) => _isVideoActive = true);
    // controller.addListener(() => notifyListeners());
    controller.setLooping(true);
    // controller.play();
    return controller;
  }

  Future<ResponseEntity> likePost(int id) async {
    final ResponseEntity entity = await galleryCase.likePost(id);
    return entity;
  }

  void svipeOld(BuildContext context) {
    if (_isNext) {
      _isNext = false;
      _videoIndex--;
    } else if (!_isOld) {
      _isOld = true;
      if (videos != null) {
        if (0 < _videoIndex) {
          _videoIndex--;
          // initSvipeVideo(videos![_videoIndex].videoUrl).then((control) {
          if (_isOld) {
            _isOld = false;
            videoSpiveController
                .previousPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut)
                .then((value) {
              // if (_isVideoActive) {

              _videoControls[_videoIndex + 1]?.pause();
              if (_videoControls[_videoIndex] == null) {
                initSvipeVideo(videos![_videoIndex].videoUrl).then((control) {
                  videoControlsFill = control;
                  VideoP.of(context, listen: false).changePlayPause(false);
                  _pageIndex--;
                  play();
                });
              } else {
                VideoP.of(context, listen: false).changePlayPause(false);
                _pageIndex--;
                play();
              }
              // }
              print(
                  "Video page svipe Old=$_videoIndex    page Svidep old=$_pageIndex");
            });
          }
        } else {
          Future.delayed(const Duration(seconds: 1)).then((value) {
            _isOld = false;
            notifyListeners();
          });
        }
      }
    }
    notifyListeners();
  }

  void svipeNext(BuildContext context) {
    if (_isOld) {
      _isOld = false;
      _videoIndex++;
    } else if (!_isNext) {
      _isNext = true;
      if (videos != null) {
        if (videos!.length - 1 > _videoIndex) {
          _videoIndex++;
          // initSvipeVideo(videos![_videoIndex].videoUrl).then((control) {
          if (_isNext) {
            _isNext = false;
            videoSpiveController
                .nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut)
                .then((value) {
              // if (_isVideoActive) {
              _videoControls[_videoIndex - 1]?.pause();
              if (_videoControls[_videoIndex] == null) {
                initSvipeVideo(videos![_videoIndex].videoUrl).then((control) {
                  videoControlsFill = control;
                  VideoP.of(context, listen: false).changePlayPause(false);
                  _pageIndex++;
                  play();
                });
              } else {
                VideoP.of(context, listen: false).changePlayPause(false);
                _pageIndex++;
                play();
              }
              // }
            });
          }
          // });
        } else {
          Future.delayed(const Duration(seconds: 1)).then((value) {
            _isNext = false;
            notifyListeners();
          });
        }
      }
    }
    notifyListeners();
  }

//=================================================================================
  // VideoEntity obj = VideoEntity(
  //   title: "lo sdfsdfr sdf sdgsdy twer afzsdf g aszdgvzdsgfv zsdfcвп",
  //   videoUrl:
  //       "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  //   likeCount: 14785,
  //   user: UserModel(
  //       id: 1, avatarImg: "", name: "100haryt.com", role: Role.Official),
  //   provious: 1,
  //   next: 3,
  // );
  int _selectVideoCategoryIndex = 0;
  int get selectVideoCategoryIndex => _selectVideoCategoryIndex;
  void chageSelectedVideoCategoryIndex(int index) {
    _selectVideoCategoryIndex = index;
    notifyListeners();
  }

  VideoEntity video = VideoEntity(
    title: "lo sdfsdfr sdf sdgsdy twer afzsdf g aszdgvzdsgfv zsdfcвп",
    videoUrl:
        // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
        "http://95.85.126.113:8080/static/video/f7a6a57195e8e6ffd372b072794fddf1.mp4",
    likeCount: 14785,
    user: UserModel(
        id: 1, avatarImg: "", name: "100haryt.com", role: Role.Official),
    provious: 1,
    next: 3,
  );

  List<ContentCardEntity>? videos = [];
  // VideoEntity video = VideoEntity.empty;

  void fillVideos(int categoryId) async {
    try {
      videos = null;
      _videoControls = [];
      notifyListeners();
      videos = await galleryCase.getVideos(categoryId);
      _videoControls = List.generate(videos!.length, (index) => null);
      // fillSubs();
      notifyListeners();
    } catch (err) {
      throw ("Error VideoDataP>fillVideos(): $err");
    }
  }

  Future<VideoEntity> fillVideo(int id) async {
    try {
      video = await galleryCase.getVideo(id);
      return video;
      // fillSubs();
      // notifyListeners();
    } catch (err) {
      throw ("Error VideoDataP>fillVideo(id): $err");
    }
  }

//=================================================================================
  int _videoIndex = 0;
  int get videoIndex => _videoIndex;
  void changeIndex(int index) {
    _videoIndex = index;
    notifyListeners();
  }

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  void changePageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

//=================================================================================
  AnimationController? _animControl;
  AnimationController? get likeAnim => _animControl;
  Animation<double>? _prossesAnim;
  Animation<double>? get likeProssesAnim => _prossesAnim;
  changeLikeAnim(AnimationController control) {
    _animControl = control;
    notifyListeners();
  }

  changeLikeProsses(Animation<double> prosses) {
    _prossesAnim = prosses;
    notifyListeners();
  }

  void get playLike {
    if (_animControl != null) {
      _animControl!.reset();
      _animControl!.forward();
    }
  }

//=================================================================================

  static VideoDataP of(BuildContext context, {bool listen = true}) =>
      Provider.of<VideoDataP>(context, listen: listen);
}
