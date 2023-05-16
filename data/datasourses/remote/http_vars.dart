import 'package:hive/hive.dart';

import '/config/vars/constants.dart';

import '../../../domanin/usecases/hive_case.dart';

class Uris {
  static Uri mainPage = Uri.parse("https://it.net.tm/arzanapi/api/v1/mobile");
  static Uri register =
      Uri.parse("https://it.net.tm/arzanapi/api/v1/auth/user/register");
  static Uri login =
      Uri.parse("https://it.net.tm/arzanapi/api/v1/auth/user/login");
  static Uri banner(String welayat, String page) => Uri.parse(
      "https://it.net.tm/arzanapi/api/v1/mobile?welayat=$welayat?page=$page");
  static Uri discounts = Uri.parse("https://it.net.tm/arzanapi/api/v1/mobile");
  static Uri postDiscount =
      Uri.parse("https://it.net.tm/arzanapi/api/v1/mobile");
}

class Headers {
  static Map<String, String> mainPage = {'Content-Type': 'aplication/json'};
   static Map<String, String> addPost(String token) => {
    'Content-Type': 'multipart/form-data',
    'accessToken': token,
  };
}
