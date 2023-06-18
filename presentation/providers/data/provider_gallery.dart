import 'package:video_player/video_player.dart';

import '/domanin/entities/galery/big_content_card_entity.dart';
import '../../../domanin/entities/baner_entity.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../../../domanin/entities/galery/gallery_entity.dart';
import '../../../domanin/entities/galery/img_card_entity.dart';

class GalleryP extends ChangeNotifier {
  // final MainPageCase galleryCase;
  // GalleryP({required this.mainPageCase});

  // // MainPageEntity entity = MainPageEntity.empty;
  // MainPageEntity entity = MainPageEntity.frowJson(api);

  // Future<void> fillEntity() async {
  //   // try {
  //   //   entity = await mainPageCase.get();
  //   //   notifyListeners();
  //   // } catch (err) {
  //   //   throw ("Error MainPageP: $err");
  //   // }
  // }

  List<ImgCardEntity> imgEntity = [
    ImgCardEntity(
      id: 1,
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSafaDKQ9bXl8GzQUza0ye7V0bsKAjnfmGgtw&usqp=CAU",
      isEmpty: false,
      liked: 150,
      viewed: 1251,
    ),
    ImgCardEntity(
      id: 1,
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSafaDKQ9bXl8GzQUza0ye7V0bsKAjnfmGgtw&usqp=CAU",
      isEmpty: false,
      liked: 150,
      viewed: 1251,
    ),
    ImgCardEntity(
      id: 1,
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSafaDKQ9bXl8GzQUza0ye7V0bsKAjnfmGgtw&usqp=CAU",
      isEmpty: false,
      liked: 150,
      viewed: 1251,
    ),
    ImgCardEntity(
      id: 1,
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSafaDKQ9bXl8GzQUza0ye7V0bsKAjnfmGgtw&usqp=CAU",
      isEmpty: false,
      liked: 150,
      viewed: 1251,
    ),
  ];

  GalleryEntity imgGallery = GalleryEntity(
    banners: [
      BanerEntity(
          id: 3,
          img:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU"),
      BanerEntity(
          id: 2,
          img:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU"),
      BanerEntity(
          id: 3,
          img:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU"),
    ],
    folders: [
      BigCardEntity(
        id: 1,
        userImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnTjWfJm21yqNcNxD_yQO3fI08q2OKIVN54g&usqp=CAU",
        userName: "100haryt.com",
        banerImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
        allCount: 12,
        allShaered: 720,
        allViewed: 14756,
        name:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
        isEmpty: false,
      ),
      BigCardEntity(
        id: 1,
        userImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
        userName: "Mercedes-Benz",
        banerImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
        allCount: 12,
        allShaered: 720,
        allViewed: 14756,
        name:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
        isEmpty: false,
      ),
      BigCardEntity(
        id: 1,
        userImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnTjWfJm21yqNcNxD_yQO3fI08q2OKIVN54g&usqp=CAU",
        userName: "100haryt.com",
        banerImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
        allCount: 12,
        allShaered: 720,
        allViewed: 14756,
        name:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
        isEmpty: false,
      ),
      BigCardEntity(
        id: 1,
        userImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
        userName: "Mercedes-Benz",
        banerImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
        allCount: 12,
        allShaered: 720,
        allViewed: 14756,
        name:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
        isEmpty: false,
      ),
    ],
    isEmpty: false,
  );

  Future<void> fillImgFolders() async {
    try {
      // imgEntity = await galleryCase.get();
      notifyListeners();
    } catch (err) {
      throw ("Error GalleryP fillImgFolders: $err");
    }
  }

  Future<void> fillImagesEntity() async {
    try {
      // imgEntity = await galleryCase.get();
      notifyListeners();
    } catch (err) {
      throw ("Error GalleryP fillImagesEntity: $err");
    }
  }

//=================================================================================
  PageController videoSpiveController = PageController(
    initialPage: 0,
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

  void get svipeOld {
    if (_isNext) {
      _isNext = false;
    } else {
      _isOld = true;
    }
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (_isOld) {
        _isOld = false;
        videoSpiveController.previousPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut);
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
    switchToNextVideo();
    // Future.delayed(const Duration(seconds: 2)).then((value) {
    //   if (_isNext) {
    //     _isNext = false;
    //     videoSpiveController.nextPage(
    //         duration: const Duration(milliseconds: 200),
    //         curve: Curves.easeInOut);
    //     notifyListeners();
    //   }
    // });
    notifyListeners();
  }

//=================================================================================
// VideoPlayerController? videoControl()=>VideoService( videoUrl: )
// VideoPlayerController? videoControl()=>VideoService( videoUrl: )

  // void createVideo(String videoURL) {
  //   VideoService(videoUrl: videoURL).create;
  //   notifyListeners();
  // }

  // VideoPlayerController? get videoControl => VideoService().control;
  // void get disposeVideo => VideoService().disposeVideo;

  VideoPlayerController? _controller;
  List<String> _videoUrls = [];
  VideoPlayerController? get controller => _controller;

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

  void seekTo(Duration position) {
    _controller?.seekTo(position);
    notifyListeners();
  }

  switchToNextVideo() {
    // _videoUrls.insert(0, _videoUrls.removeAt(_videoUrls.length - 1));
    initializeVideoPlayer(_videoUrls[2]).then((value) {
      if (_isNext) {
        _isNext = false;
        videoSpiveController.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut);
        notifyListeners();
      }
    });
  }

  Future<void> initializeVideoPlayer(String videoUrl) async {
    final controller = VideoPlayerController.network(videoUrl);
    await controller.initialize();
    controller.setLooping(true);
    controller.play();
    this.controller = controller;
  }

  void setVideoUrls(List<String> urls) {
    _videoUrls = urls;
    initializeVideoPlayer(urls[1]);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

//=================================================================================
//=================================================================================

  static GalleryP of(BuildContext context, {bool listen = true}) =>
      Provider.of<GalleryP>(context, listen: listen);
}
