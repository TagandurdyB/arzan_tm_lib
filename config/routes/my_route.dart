import 'package:flutter/material.dart';

import '../../presentation/views/pages/page_about.dart';
import '../../presentation/views/pages/page_home.dart';
import '../../presentation/views/pages/page_logo.dart';

class Rout {
  static const String logo = "/";
  static const String home = "/HomePage";
  static const String about = "/AboutPage";

  static Map<String, Widget Function(dynamic)> pages = {
    logo: (context) => const LogoPage(),
    home: (context) => const HomePage(),
    about: (context) => const AboutPage(),
  };
}
