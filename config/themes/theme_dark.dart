
import 'package:arzan_tm/config/themes/colors.dart';
import 'package:arzan_tm/config/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme() {
  //  final providerTheme = Provider.of<ProviderTheme>(context);
  return ThemeData(
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
