import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:video_player/video_player.dart';

class Formater {
  static String twoDigit(int n) {
    return n.toString().padLeft(2, "0");
  }

  static String calendar(DateTime date) {
    return "${twoDigit(date.day)}.${twoDigit(date.month)}.${date.year}";
  }

  static String colck(DateTime date) {
    return "${twoDigit(date.minute)}:${twoDigit(date.second)}";
  }

  static String rounder(int num) {
    final int length = "$num".length;
    return "${num > 999 ? "${"$num".substring(0, length - 3)},${"$num".substring(length - 3)}" : num}";
  }

  static Map<String, dynamic> jWTDecode(String code) {
    return JwtDecoder.decode(code);
  }

  static int getJWTId(String code) {
    return JwtDecoder.decode(code)["id"];
  }

  static List<String> tagSeperator(String tags) {
    List<String> tagList = tags.replaceAll("#", " #").split(' ');
    tagList.removeAt(0);
    return tagList;
  }

  static String locations(List<String> locations) {
    String str = "";
    for (var element in locations) {
      final e = welayatCode(element);
      str = "$str $e,";
    }
    return str.substring(0, str.length - 1);
  }

  static String welayatCode(String wel) {
    switch (wel) {
      case "Aşgabat":
        return "AG";
      case "Balkan":
        return "BN";
      case "Ahal":
        return "AH";
      case "Mary":
        return "MR";
      case "Lebap":
        return "LB";
      case "Daşoguz":
        return "DZ";
      default:
        return "TM";
    }
  }

  static bool searcher(List<String> items, String item) {
    final result = items.where((element) => element == item);
    return result.isNotEmpty;
  }

  static bool hasChar(String str) {
    int length = 0;
    for (int i = 0; i <= 9; i++) {
      if (str.contains("$i")) length++;
    }
    for (int i = 0; i < simbols.length; i++) {
      if (str.contains(simbols[i])) length++;
    }
    final int finalLength = str.length - length;
    return finalLength > 0;
  }

  static bool isUpperCase(String letter) {
    if (!hasChar(letter)) return false;
    return letter == letter.toUpperCase();
  }

  static bool hasUpper(String text) {
    for (int i = 0; i < text.length; i++) {
      if (isUpperCase(text[i])) return true;
    }
    return false;
  }

  static bool isLowerCase(String letter) {
    if (!hasChar(letter)) return false;
    return letter == letter.toLowerCase();
  }

  static bool hasLower(String text) {
    for (int i = 0; i < text.length; i++) {
      if (isLowerCase(text[i])) return true;
    }
    return false;
  }

  static bool hasNum(String text) {
    for (int i = 0; i <= 9; i++) {
      if (text.contains("$i")) return true;
    }
    return false;
  }

  static List simbols = [
    "!",
    "@",
    "#",
    "\$",
    "%",
    "^",
    "&",
    "*",
    "(",
    ")",
    "-",
    "_",
    "+",
    "=",
    " ",
    "/",
  ];
  static bool hasSimbol(String text) {
    for (int i = 0; i < simbols.length; i++) {
      if (text.contains(simbols[i])) return true;
    }
    return false;
  }
}

class TimeConterter {
  final VideoPlayerController controller;
  TimeConterter(this.controller);

  Duration _roundDuration(Duration value) =>
      Duration(milliseconds: value.inMilliseconds.round());

  Duration get videoDuration => _roundDuration(controller.value.duration);

  Duration get videoPosition => _roundDuration(controller.value.position);

  String durationToString(Duration durat) {
    String result = "00:00";
    if (videoDuration.inHours != 0) {
      result = [durat.inHours, durat.inMinutes, durat.inSeconds]
          .map((seg) => seg.remainder(60).toString().padLeft(2, "0"))
          .join(":");
    } else {
      result = [durat.inMinutes, durat.inSeconds]
          .map((seg) => seg.remainder(60).toString().padLeft(2, "0"))
          .join(":");
    }
    return result;
  }

  String _getPosition() => durationToString(videoPosition);
  String get getPosition => _getPosition();

  String _getDuration() => durationToString(videoDuration);
  String get getDuration => _getDuration();

  String get getTime => "${_getPosition()} / ${_getDuration()}";
}
