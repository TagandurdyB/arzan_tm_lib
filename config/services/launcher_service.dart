// ignore_for_file: deprecated_member_use

// import 'package:telephony/telephony.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherService {
  static Future<bool> phone(String num) async {
    return await launch("tel://$num");
  }

  static Future<bool> sms(String num, String massage) async {
    // if (Platform.isAndroid) {
    //   //FOR Android
    //   url = 'sms:+6000000000?body=message';
    //   await launch(url);
    // } else if (Platform.isIOS) {
    //   //FOR IOS
    //   url = 'sms:+6000000000&body=message';
    // }
    final String url = 'sms$num:?body=$massage';
    return await launch(url);
  }

  void sendSMS(String phoneNumber, String message) async {
    String url = 'sms:$phoneNumber?body=${Uri.encodeQueryComponent(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch SMS intent';
    }
    // final Telephony telephony = Telephony.instance;
    // telephony.sendSms(to: phoneNumber, message: message);
  }
}
