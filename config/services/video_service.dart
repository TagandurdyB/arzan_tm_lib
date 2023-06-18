import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

enum VideoType { asset, network, file }

VideoPlayerController _control = VideoPlayerController.network("");
VideoPlayerController? _control2;

class VideoService {
  final String? videoUrl;
  final VideoType type;

  VideoService({this.type = VideoType.network, this.videoUrl});

  bool _isCreated = false;
  // bool _isPlayed = false;
  // bool get isPlayed=>_isPlayed

  void get create {
    try {
      if (type == VideoType.asset) {
        _control = VideoPlayerController.asset(videoUrl!);
      } else if (type == VideoType.file) {
        _control = VideoPlayerController.file(File(videoUrl!));
      } else if (type == VideoType.network) {
        _control = VideoPlayerController.network(videoUrl!);
      }
      _isCreated = true;
      debugPrint("VideoService create $videoUrl success!");
    } catch (e) {
      debugPrint("VideoService Error create:=$e");
    }
  }

  void get disposeVideo {
    if (_isCreated) _control.dispose();
  }

  void get play {
    if (_isCreated) _control.play();
  }

  void get pause {
    if (_isCreated) _control.pause();
  }

  bool get isPlaying {
    if (_isCreated) {
      return _control.value.isPlaying;
    }
    return false;
  }

  bool get isInitialized {
    if (_isCreated) {
      return _control.value.isInitialized;
    }
    return false;
  }

  VideoPlayerController? get control {
    if (_isCreated) {
      return _control;
    } else {
      return null;
    }
  }
}
