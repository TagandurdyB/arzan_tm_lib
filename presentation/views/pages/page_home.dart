import 'package:arzan_tm/presentation/views/scaffold/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../scaffold/custom_navigation_bar.dart';
import '../scaffold/no_app_bar_scaffold.dart';
import '../screens/home_screens.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
        drawer: CustomDrawer(),
        bottomNavigationBar: const CustomNavigationBar(),
        body: HomeScreens());
  }
}
