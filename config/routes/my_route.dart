import 'package:flutter/material.dart';

import '../../presentation/views/pages/page_about.dart';
import '../../presentation/views/pages/page_home.dart';
import '../../presentation/views/pages/page_logo.dart';
import '../../presentation/views/pages/page_recovery.dart';
import '../../presentation/views/pages/page_search.dart';
import '../../presentation/views/pages/page_settings.dart';
import '../../presentation/views/pages/page_user.dart';

class Rout {
  static const String logo = "/";
  static const String home = "/HomePage";
  static const String about = "/AboutPage";
  static const String settings = "/SettingsPage";
  static const String search = "/SearchPage";
  static const String user = "/UserPage";
  static const String recovey = "/RecoveryPage";

  static Map<String, Widget Function(dynamic)> pages = {
    logo: (context) => const LogoPage(),
    home: (context) => const HomePage(),
    about: (context) => const AboutPage(),
    settings: (context) => SettingsPage(),
    search: (context) =>  SearchPage(),
    user: (context) =>  UserPage(),
    recovey: (context) =>  RecoveryPage(),
  };
}
