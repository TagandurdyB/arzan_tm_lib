// ignore_for_file: must_be_immutable

import '/presentation/views/widgets/custom_avatar.dart';
import 'package:flutter/material.dart';

import '../../../config/services/my_size.dart';
import '../../../config/vars/constants.dart';
import '../../providers/data/hive_provider.dart';

class ScreenUser extends StatelessWidget {
  ScreenUser({super.key});

  late BuildContext context;
  final arentir = MySize.arentir;
  late HiveP hiveP;
  @override
  Widget build(BuildContext context) {
    hiveP = HiveP.of(context, listen: false);
    return Column(children: [
      buildTopBar,
      const SizedBox(height: 15),
      buildContent,
      // SettingsContent()
    ]);
  }

  Widget get buildTopBar => Container(
        color: Colors.transparent,
        height: MySize.width * 0.72,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                height: MySize.width * 0.58,
                width: MySize.width,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.asset("assets/logo_png.png")),
                ),
            Positioned(
              top: 1,
              child: Container(
                height: kToolbarHeight,
                width: MySize.width,
                color: Colors.black26,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: const [
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              child: CustomAvatar(
                imgUrl: "",
                borderColor: Colors.white,
                radius: arentir * 0.25,
                bgColor: Colors.white,
              ),
            ),
          ],
        ),
      );

  Widget get buildContent => Container(
        color: Colors.transparent,
        child: Column(
          children: [
            const Text("Julian Herbst"),
            const SizedBox(height: 6),
            iconGroup(Icons.phone, "+993 61 000000"),
            const SizedBox(height: 6),
            iconGroup(Icons.location_on, hiveP.readStr(Tags.hiveWelayat)!),
          ],
        ),
      );

  Widget iconGroup(IconData iconD, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(iconD), Text(text)],
    );
  }
}
