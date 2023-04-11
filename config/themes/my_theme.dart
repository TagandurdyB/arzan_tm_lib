import 'package:arzan_tm/config/themes/colors.dart';
import 'package:flutter/services.dart';

import 'styles.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData light = theme(ColorsLight(), StylesLight());
  static ThemeData dark = theme(ColorsDark(), StylesDark());

  static ThemeData theme(ColorsLight colors, StylesLight styles) {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(),
      ).apply(
        bodyColor: colors.text,
        // displayColor: Colors.blue,
      ),
      primarySwatch: Colors.blue,
      canvasColor: colors.canvas,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        color: colors.appbarbg,
        shadowColor: colors.appBarShadow,
        titleTextStyle: styles.appBar,
        iconTheme: IconThemeData(
          color: colors.appBarIcon,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: colors.navigatActiveIconBg,
          type: BottomNavigationBarType.fixed,
          backgroundColor: colors.canvas,
          selectedIconTheme: IconThemeData(
            color: colors.navigatActiveIcon,
            //  size: MySize.arentir * 0.1,
          ),
          unselectedIconTheme: IconThemeData(
            color: colors.navigatUnactiveIcon,
          )),
    );
  }
}
