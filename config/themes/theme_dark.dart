import '/config/vars/colors.dart';
import '/config/vars/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(),
    ).apply(
      bodyColor: ColorsDark.text,
      // displayColor: Colors.blue,
    ),
    primarySwatch: Colors.blue,
    canvasColor: ColorsDark.canvas,
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark),
        color: ColorsDark.appbarbg,
        shadowColor: Colors.transparent,
        titleTextStyle: StylesDark().appBar,
        iconTheme: const IconThemeData(
          color: Colors.orange,
        )),
  );
}
