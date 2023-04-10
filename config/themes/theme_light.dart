import '/config/vars/colors.dart';
import '/config/vars/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(),
    ).apply(
      bodyColor: ColorsLight.text,
      // displayColor: Colors.blue,
    ),
    primarySwatch: Colors.blue,
    canvasColor: ColorsLight.canvas,
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark),
        color: ColorsLight.appbarbg,
        shadowColor: Colors.transparent,
        titleTextStyle: StylesLight().appBar,
        iconTheme: const IconThemeData(
          color: Colors.orange,
        )),
  );
}
