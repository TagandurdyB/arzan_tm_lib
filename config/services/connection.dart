// ignore_for_file: avoid_print

import 'dart:io';

class ConnectionService {
  static Future<bool> isConnected() async {
    bool answer = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('Connected');
        answer = true;
      }
    } on SocketException catch (e) {
      print('Not connected. ERROR:$e');
      answer = false;
    }
    return answer;
  }
}
