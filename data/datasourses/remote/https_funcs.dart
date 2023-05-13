import 'package:http/http.dart';

class HttpsFuncs {
  static responseChecker(Response response, dynamic obj) {
    if (response.statusCode == 200) {
      return obj;
    } else {
      throw ("Error in responseChecker!!! statusCode:${response.statusCode}");
    }
  }
}
