import '/config/themes/my_theme.dart';
import '/presentation/providers/view/provider_theme.dart';
import 'package:flutter/material.dart';

import 'config/routes/my_route.dart';
import 'injector.dart';

void main() {
  runApp(const Injector(router: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeP.of(context).mode,
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      routes: Rout.pages,
      initialRoute: Rout.logo,
    );
  }
}
