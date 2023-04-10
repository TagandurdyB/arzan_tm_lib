import 'package:arzan_tm/presentation/providers/view/provider_theme.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Injector extends StatelessWidget {
  final Widget router;
  const Injector({required this.router, super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          // ChangeNotifierProvider<GlobalProvider>(
          //     create: (_) => GlobalProvider(
          //         getUserDetail: GetUserDetail(ApiRepositoryImpl(
          //             ApiRemoteDataSourceImpl(http.Client())))))
          ChangeNotifierProvider<ThemeP>(create: (context) => ThemeP())
        ],
        child: router,
      );
}
