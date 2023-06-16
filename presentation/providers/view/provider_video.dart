import '/config/services/my_orientation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ScreenMode { landscape, portrate }

class VideoP extends ChangeNotifier {
  bool _isPlayed = false;
  bool get isPlayed => _isPlayed;
  void changePlayPause(bool isPlay) {
    _isPlayed = isPlay;
    notifyListeners();
  }

  void _delayedForground() {
    Future.delayed(const Duration(seconds: 3)).then((val) {
      debugPrint("VideoP isPlayed=$_isPlayed");
      if (!_isPlayed) {
        _isForvardShow = false;
      } else {
        _delayedForground();
      }
      notifyListeners();
    });
  }

  bool _isForvardShow = false;
  bool get isForvardShow => _isForvardShow;
  void get forvardShow {
    if (!_isForvardShow) {
      _isForvardShow = true;
      notifyListeners();
      _delayedForground();
    }
  }

  void get forvordHidden {
    _isForvardShow = false;
    notifyListeners();
  }

  bool _isLadscape = false;
  bool get isLadscape => _isLadscape;
  bool _isPortrade = true;
  bool get isPortrade => _isPortrade;

  void changeScreenMode(ScreenMode mode) {
    if (mode == ScreenMode.portrate) {
      _isPortrade = true;
      _isLadscape = false;
      MyOrientation.setPortraitUp();
      MyOrientation.disableSystemUI;
    } else if (mode == ScreenMode.landscape) {
      _isPortrade = false;
      _isLadscape = true;
      MyOrientation.setLandscape();
    }
    notifyListeners();
  }

  void get tongleScreenMode {
    if (_isPortrade) {
      changeScreenMode(ScreenMode.landscape);
    } else {
      changeScreenMode(ScreenMode.portrate);
    }
    notifyListeners();
  }

  void get cleanVideo {
    changePlayPause(false);
    changeScreenMode(ScreenMode.portrate);
  }

  void get svipeVideo {
    changePlayPause(false);
    MyOrientation.disableSystemUI;
    //  changeScreenMode(ScreenMode.portrate);
  }

  static VideoP of(BuildContext context, {bool listen = true}) =>
      Provider.of<VideoP>(context, listen: listen);
}
