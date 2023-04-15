import '/presentation/providers/data/provider_revovery.dart';

import '/presentation/providers/view/provider_theme.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'data/datasourses/local/hive_local_datacource.dart';
import 'data/repositories/hive_repository_impl.dart';
import 'domanin/usecases/theme_case.dart';
import 'presentation/providers/data/data_provider_theme.dart';
import 'presentation/providers/view/provider_navigation.dart';

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
          ChangeNotifierProvider<ThemeP>(create: (context) => ThemeP()),
          ChangeNotifierProvider<ProviderNavigation>(
              create: (context) => ProviderNavigation()),
                ChangeNotifierProvider<RecoveryP>(
              create: (context) => RecoveryP()),
        ],
        child: router,
      );
}
