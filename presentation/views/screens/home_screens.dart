import '/presentation/providers/view/provider_navigation.dart';
import 'package:flutter/material.dart';

import 'acaunt_screens.dart';
import 'screen_register.dart';
import 'screen_main.dart';

// ignore: must_be_immutable
class HomeScreens extends StatelessWidget {
  HomeScreens({super.key});

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return buildScreens();
  }

  List<Widget> screens = [
    const ScreenMain(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
     AcauntScreens(),
  ];

  Widget buildScreens() {
    final provid = ProviderNavigation.of(context);
    return Stack(
      children: List.generate(
          screens.length,
          (index) => Builder(
                builder: (context) => Offstage(
                  offstage: index != provid.selectScreen,
                  child: screens[index],
                ),
              )),
    );
  }
}