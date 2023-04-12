import 'package:hive_flutter/hive_flutter.dart';

import '/config/themes/my_theme.dart';
import '/presentation/providers/view/provider_theme.dart';
import 'package:flutter/material.dart';

import 'config/routes/my_route.dart';
import 'config/system_info/my_orientation.dart';
import 'config/vars/constants.dart';
import 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(Tags.hiveBase);
  runApp(const Injector(router: MyApp()));
  MyOrientation.systemUiOverlayStyle();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeP.of(context).mode,
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      routes: Rout.pages,
      initialRoute: Rout.logo,
    );
  }
}
