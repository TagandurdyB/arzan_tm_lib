import '/presentation/providers/data/provider_acaunt.dart';

import 'package:flutter/material.dart';

import 'screen_register.dart';
import 'screen_user.dart';

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
    ScreenUser(),
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
