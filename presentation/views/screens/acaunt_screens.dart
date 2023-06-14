import '/presentation/providers/data/provider_acaunt.dart';

import 'package:flutter/material.dart';

import 'profile/profile_screens.dart';
import 'register/screen_register.dart';
import 'profile/screen_user.dart';

// ignore: must_be_immutable
class AcauntScreens extends StatelessWidget {
  AcauntScreens({super.key});

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return buildScreens();
  }

  List<Widget> screens = [
    const ScreenRegister(),
     ProfileScreens(),
  ];

  Widget buildScreens() {
    final provid = AcauntP.of(context);
    return Stack(
      children: List.generate(
          screens.length,
          (index) => Builder(
                builder: (context) => Offstage(
                  offstage: provid.isSing ? index != 1 : index != 0,
                  child: screens[index],
                ),
              )),
    );
  }
}
