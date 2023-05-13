import '../../presentation/views/pages/page_discounts.dart';
import '/presentation/views/pages/page_tops.dart';

import '/presentation/views/pages/page_images.dart';
import '/presentation/views/pages/page_videos.dart';

import '../../presentation/views/pages/page_acaunt.dart';
import '/presentation/views/pages/page_chosen.dart';

import '/presentation/views/pages/page_send_sms.dart';
import 'package:flutter/material.dart';

import '../../presentation/providers/data/provider_acaunt.dart';
import '../../presentation/views/pages/page_about.dart';
import '../../presentation/views/pages/page_home.dart';
import '../../presentation/views/pages/page_logo.dart';
import '../../presentation/views/pages/page_new_pass.dart';
import '../../presentation/views/pages/page_recovery_phone.dart';
import '../../presentation/views/screens/screen_search.dart';
import '../../presentation/views/pages/page_settings.dart';
import '../../presentation/views/pages/page_verification.dart';
import '../../presentation/views/widgets/success_pop.dart';

class Rout {
  static const String logo = "/";
  static const String home = "/HomePage";
  static const String about = "/AboutPage";
  static const String settings = "/SettingsPage";
  static const String search = "/SearchPage";
  static const String recoveryPhone = "/RecoveryPhonePage";
  static const String recoveryVerifi = "/RecoveryVerificarionPage";
  static const String signUpVerifi = "/SignUpVerificarionPage";
  static const String newPass = "/NewPassPage";
  static const String sendSMS = "/SendSmsPage";
  static const String chosen = "/ChosenPage";
  static const String acaunt = "/AcauntPage";
  static const String images = "/ImagesPage";
  // static const String imagesDetal = "/ImagesDetalPage";
  static const String videos = "/VideosPage";
  static const String tops = "/TopsPage";
  static const String discounts = "/DiscountsPage";

  static Map<String, Widget Function(dynamic)> pages = {
    logo: (context) => const LogoPage(),
    home: (context) => const HomePage(),
    about: (context) => const AboutPage(),
    settings: (context) => SettingsPage(),
    search: (context) => ScreenSearch(),
    recoveryPhone: (context) => const RecoveryPhonePage(),
    recoveryVerifi: (context) => VerificarionPage(
          btnFunc: () => Navigator.pushNamed(context, Rout.newPass),
        ),
    signUpVerifi: (context) => VerificarionPage(
          title: "Tassyklama",
          btnName: "Tassykla",
          btnFunc: () {
            SuccessPop.pop(context, true);
            Future.delayed(const Duration(seconds: 2)).then((value) {
              AcauntP.of(context, listen: false).logIn;
              Navigator.popUntil(context, (route) => route.isFirst);
            });
          },
        ),
    newPass: (context) => const NewPassPage(),
    sendSMS: (context) => SendSmsPage(),
    chosen: (context) => const ChosenPage(),
    acaunt: (context) => const AcauntPage(),
    images: (context) => ImagesPage(),
    // imagesDetal:(context)=> const ImageDetalPage(),
    videos: (context) => VideosPage(),
    tops: (context) => TopsPage(),
    discounts: (context) => const DiscountsPage(),
  };
}
