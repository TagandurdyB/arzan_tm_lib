import '/domanin/usecases/register_case.dart';

import '/presentation/providers/data/main_page_provider.dart';
import '/domanin/usecases/main_page_case.dart';
import 'data/datasourses/remote/main_page_remote_datasource.dart';
import 'data/datasourses/remote/register_remote_datasource.dart';
import 'data/repositories/main_page_repository_impl.dart';

import '/presentation/providers/view/provider_discaunts.dart';

import 'data/repositories/register_repository_impl.dart';
import 'presentation/providers/data/provider_acaunt.dart';

import '/presentation/providers/view/provider_theme.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'data/datasourses/local/hive_local_datacource.dart';
import 'data/repositories/hive_repository_impl.dart';
import 'domanin/usecases/theme_case.dart';
import 'presentation/providers/data/data_provider_theme.dart';
import 'presentation/providers/data/provider_video.dart';
import 'presentation/providers/view/provider_navigation.dart';

import 'package:http/http.dart' as http;

import 'presentation/providers/view/provider_view_post.dart';

class Injector extends StatelessWidget {
  final Widget router;
  const Injector({required this.router, super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<DataThemeProvider>(
              create: (_) => DataThemeProvider(
                    getThemeModeCase: ThemeCase(HiveThemeRepositoryImpl(
                        HiveThemeLocalDataSourceImpl())),
                  )),
          ChangeNotifierProvider<MainPageP>(
              create: (_) => MainPageP(
                    mainPageCase: MainPageCase(MainPageRepositoryImpl(
                        MainPageDataSourceImpl(http.Client()))),
                  )),
          ChangeNotifierProvider<AcauntP>(
              create: (_) => AcauntP(
                    registerCase: RegisterCase(RegisterRepositoryImpl(
                        RegisterDataSourceImpl(http.Client()))),
                  )),
          ///////////////////////////////////////////////////////////////////////
          ChangeNotifierProvider<ThemeP>(create: (context) => ThemeP()),
          ChangeNotifierProvider<ProviderNav>(
              create: (context) => ProviderNav()),
          ChangeNotifierProvider<DiscountProvid>(
              create: (context) => DiscountProvid()),
          ChangeNotifierProvider<VideoP>(create: (context) => VideoP()),
          ChangeNotifierProvider<PostP>(create: (context) => PostP()),
        ],
        child: router,
      );
}
