import 'package:jwt_decoder/jwt_decoder.dart';

class Formater {
  static String twoDigit(int n) {
    return n.toString().padLeft(2, "0");
  }

  static String calendar(DateTime date) {
    return "${twoDigit(date.day)}.${twoDigit(date.month)}.${date.year}";
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
}
