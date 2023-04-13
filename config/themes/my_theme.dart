import 'package:arzan_tm/config/themes/colors.dart';
import 'package:flutter/services.dart';

import 'styles.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData light = theme(ColorsLight(), StylesLight(), Brightness.dark);
  static ThemeData dark = theme(ColorsDark(), StylesDark(), Brightness.light);

  static ThemeData theme(
    ColorsLight colors,
    StylesLight styles,
    Brightness brightness,
  ) {
    return ThemeData(
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: colors.text),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? colors.switchActiv
              : colors.switchUnActiv,
        ),
        trackColor: MaterialStateProperty.all(colors.switchBg),
        //  materialTapTargetSize: MaterialTapTargetSize.values,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: colors.text),
      ).apply(
        bodyColor: colors.text,
        // displayColor: Colors.blue,
      ),
      primarySwatch: Colors.blue,
      canvasColor: colors.canvas,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: colors.statusBarColor,
          statusBarIconBrightness: brightness,
          systemNavigationBarColor: colors.systemNavigationBarColor,
          systemNavigationBarIconBrightness: brightness,
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
