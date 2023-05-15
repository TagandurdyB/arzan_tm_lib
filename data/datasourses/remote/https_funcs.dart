// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart';

class HttpsFuncs {
  static responseChecker(Response response, dynamic obj) {
    if (response.statusCode == 200) {
      print("*** ${json.decode(response.body)}");
      return obj;
    } else {
      throw ("Error in responseChecker!!! statusCode:${response.statusCode}");
    }
  }
}
