import 'dart:io';

import 'package:arzan/data/datasourses/remote/http_vars.dart';

import '/presentation/providers/data/data_provider_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/config/themes/my_theme.dart';
import 'package:flutter/material.dart';

import 'config/routes/my_route.dart';
import 'config/services/my_orientation.dart';
import 'config/vars/constants.dart';
import 'domanin/entities/discounts/discount_entity.dart';
import 'injector.dart';
import 'package:http_proxy/http_proxy.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//All ways in display====================
  Wakelock.enable();
//proxy==================================
  print("IP:=${Uris.ip}    PORT:=${Uris.port}");
  HttpProxy httpProxy = await HttpProxy.createHttpProxy();
  httpProxy.host = Uris.ip; // replace with your server ip
  httpProxy.port = Uris.port; // replace with your server port
  HttpOverrides.global = httpProxy;
//=======================================

  await Hive.initFlutter();

  Hive.registerAdapter(DiscountEntityAdapter());
  await Hive.openBox<DiscountEntity>(Tags.hiveFavorites);

  await Hive.openBox(Tags.hiveBase);
  MyOrientation.systemUiOverlayStyle();
  runApp(const Injector(router: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final providerT = DataThemeProvider.of(context, listen: false);
      providerT.getIsSystem;
      providerT.getIsLight;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).platformBrightness;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: DataThemeProvider.of(context).mode,
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      routes: Rout.pages,
      initialRoute: Rout.logo,
    );
  }
}
