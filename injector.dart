import '/domanin/usecases/profile_case.dart';

import '/presentation/providers/data/provider_profile.dart';

import '/domanin/usecases/gallery_case.dart';

import '/presentation/providers/data/chosen_data_provider.dart';

import '/domanin/usecases/discounts_case.dart';

import 'data/datasourses/remote/gallery_remote_datasource.dart';
import 'data/datasourses/remote/profile_remote_datasource.dart';
import 'data/repositories/gellery_repository_impl.dart';
import 'data/repositories/profile_repository_impl.dart';
import 'domanin/usecases/values_case.dart';

import 'presentation/providers/data/values_provider.dart';

import 'data/datasourses/remote/values_remote_datasource.dart';
import 'data/datasourses/remote/discounts_remote_datasource.dart';
import 'data/repositories/values_repository_impl.dart';
import 'data/repositories/discounts_repository_impl.dart';
import 'presentation/providers/data/discount_data_provider.dart';

import '/presentation/providers/data/provider_gallery.dart';

import '/domanin/usecases/register_case.dart';

import '/presentation/providers/data/main_page_provider.dart';
import '/domanin/usecases/main_page_case.dart';
import 'data/datasourses/remote/main_page_remote_datasource.dart';
import 'data/datasourses/remote/register_remote_datasource.dart';
import 'data/repositories/main_page_repository_impl.dart';

import '/presentation/providers/view/provider_discaunts.dart';

import 'data/repositories/register_repository_impl.dart';
import 'presentation/providers/data/hive_provider.dart';
import 'presentation/providers/data/provider_acaunt.dart';

import '/presentation/providers/view/provider_theme.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'data/datasourses/local/hive_local_datacource.dart';
import 'data/repositories/hive_repository_impl.dart';
import 'domanin/usecases/hive_case.dart';
import 'presentation/providers/data/data_provider_theme.dart';
import 'presentation/providers/data/video_data_provider.dart';
import 'presentation/providers/view/provider_video.dart';
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
                    getThemeModeCase:
                        HiveCase(HiveRepositoryImpl(HiveLocalDataSourceImpl())),
                  )),
          ChangeNotifierProvider<HiveP>(
              create: (_) => HiveP(
                    getHiveCase:
                        HiveCase(HiveRepositoryImpl(HiveLocalDataSourceImpl())),
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
          ChangeNotifierProvider<ValuesP>(
              create: (_) => ValuesP(
                    valuesCase: ValuesCase(ValuesRepositoryImpl(
                        ValuesDataSourceImpl(http.Client()))),
                  )),
          ChangeNotifierProvider<DiscountDataP>(
              create: (_) => DiscountDataP(
                    discountsCase: DiscountsCase(DiscountsRepositoryImpl(
                        DiscountsDataSourceImpl(http.Client()))),
                  )),
          ChangeNotifierProvider<ChosenDataP>(create: (_) => ChosenDataP()),

          ChangeNotifierProvider<VideoDataP>(
              create: (_) => VideoDataP(
                    galleryCase: GalleryCase(GalleryRepositoryImpl(
                        GalleryDataSourceImpl(http.Client()))),
                  )),

          ChangeNotifierProvider<GalleryP>(
              create: (_) => GalleryP(
                    galleryCase: GalleryCase(GalleryRepositoryImpl(
                        GalleryDataSourceImpl(http.Client()))),
                  )),
          ChangeNotifierProvider<ProfileP>(
              create: (_) => ProfileP(
                    profileCase: ProfileCase(ProfileRepositoryImpl(
                        ProfileRemoteDataSourceImpl(http.Client()))),
                  )),

          //=============================================

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
