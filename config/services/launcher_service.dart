// ignore_for_file: deprecated_member_use

import 'package:url_launcher/url_launcher.dart';

class LauncherService {
  static Future<bool> phone(String num) async {
    return await launch("tel://$num");
  }
}
