import 'package:flutter/material.dart';

import '../../presentation/providers/data/provider_acaunt.dart';
import '../../presentation/views/pages/page_about.dart';
import '../../presentation/views/pages/page_home.dart';
import '../../presentation/views/pages/page_logo.dart';
import '../../presentation/views/pages/page_new_pass.dart';
import '../../presentation/views/pages/page_recovery_phone.dart';
import '../../presentation/views/pages/page_search.dart';
import '../../presentation/views/pages/page_settings.dart';
import '../../presentation/views/pages/page_user.dart';
import '../../presentation/views/pages/page_verification.dart';
import '../../presentation/views/widgets/success_pop.dart';

class Rout {
  static const String logo = "/";
  static const String home = "/HomePage";
  static const String about = "/AboutPage";
  static const String settings = "/SettingsPage";
  static const String search = "/SearchPage";
  static const String user = "/UserPage";
  static const String recoveryPhone = "/RecoveryPhonePage";
  static const String recoveryVerifi = "/RecoveryVerificarionPage";
  static const String signUpVerifi = "/SignUpVerificarionPage";
  static const String newPass = "/NewPassPage";

  static Map<String, Widget Function(dynamic)> pages = {
    logo: (context) => const LogoPage(),
    home: (context) => const HomePage(),
    about: (context) => const AboutPage(),
    settings: (context) => SettingsPage(),
    search: (context) => SearchPage(),
    user: (context) => UserPage(),
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
              Navigator.popUntil(context, (route) => route.isFirst);
              AcauntP.of(context, listen: false).logIn;
            });
          },
        ),
    newPass: (context) => const NewPassPage(),
  };
}
