import 'package:arzan_tm/config/themes/colors.dart';
import 'package:arzan_tm/config/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() {
  //  final providerTheme = Provider.of<ProviderTheme>(context);
  return ThemeData(
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
