// ignore_for_file: must_be_immutable

import '../../providers/view/provider_navigation.dart';
import '../screens/acaunt_screens.dart';
import '../screens/screen_add_post.dart';
import '../screens/screen_main.dart';
import '/presentation/views/scaffold/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../scaffold/custom_navigation_bar.dart';
import '../scaffold/no_app_bar_scaffold.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Widget> screens = [
    const ScreenMain(),
    const SizedBox(),
    AddPostScreen(),
    const SizedBox(),
    AcauntScreens(),
  ];

  @override
  Widget build(BuildContext context) {
    final provid = ProviderNav.of(context);
    return ScaffoldNo(
      drawer: CustomDrawer(),
      bottomNavigationBar: const CustomNavigationBar(),
      body: Stack(
        children: List.generate(
            screens.length,
            (index) => Builder(
                  builder: (context) => Offstage(
                    offstage: index != provid.selectScreen,
                    child: screens[index],
                  ),
                )),
      ),
    );
  }
}
