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
}
