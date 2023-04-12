// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class ColorsLight {
  Color statusBarColor = Colors.white;
  Color systemNavigationBarColor = Colors.white;
  Color text = Colors.black;
  Color canvas = Colors.white;
  Color appbarbg = Colors.white;
  Color appBarShadow = const Color(0xffEAEAEA);
  Color appBarIcon = Colors.black;
  Color navigationBg = Colors.white;
  Color navigatActiveIcon = const Color(0xff3E9851);
  Color navigatUnactiveIcon = const Color(0xff384854);
  Color navigatActiveIconBg = const Color(0xffDBEDE0);
}

class ColorsDark extends ColorsLight {
  @override
  Color statusBarColor = Colors.black;
  @override
  Color systemNavigationBarColor = Colors.black;
  @override
  Color text = Colors.white;
  @override
  Color canvas = Colors.black;
  @override
  Color appbarbg = const Color(0xff424242);
  @override
  Color appBarShadow = Colors.black;
  @override
  Color appBarIcon = Colors.white;
  @override
  Color navigationBg = Colors.black;
  @override
  Color navigatActiveIcon = const Color(0xff31643C);
  @override
  Color navigatUnactiveIcon = const Color(0xff3A4753);
  @override
  Color navigatActiveIconBg = const Color(0xff031508);
}
