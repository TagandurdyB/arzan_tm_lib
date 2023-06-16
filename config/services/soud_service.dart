import 'package:audioplayers/audioplayers.dart';

class SoundService {
  static void get playLike {
    final player = AudioPlayer();
    player.play(AssetSource("like_sound.mp3"));
  }
}
