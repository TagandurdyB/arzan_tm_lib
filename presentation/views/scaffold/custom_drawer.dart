// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../config/routes/my_route.dart';
import '../widgets/drawer_btn.dart';
import '../widgets/my_container.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Drawer(
      // backgroundColor: Colors.red,
      child: SafeArea(
        child: Column(
          children: [
            buildLogin,
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                // color: Colors.blue,
                child: buildContent,
              ),
            )),
            buildFooter
          ],
        ),
      ),
    );
  }

  Widget get buildLogin {
    return Container(
      alignment: Alignment.center,
      color: const Color(0xffF3FBF4),
      width: double.infinity,
      height: 77,
      child: Row(children: [buildIcon, buildText]),
    );
  }

  Widget get buildIcon {
    return MyContainer(
        shape: 30,
        borderColor: const Color(0xff228037),
        borderWidth: 3,
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(3),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.green,
        child: Image.asset("assets/logo_png.png"));
  }

  Widget get buildText {
    return const Text(
      "Ulgama girmek",
      style: TextStyle(fontSize: 15, color: Colors.black),
    );
  }

  Widget get buildContent {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      DrawerBtn(Icons.star_border, "Top hasaplar", context, num: 0),
      DrawerBtn(Icons.image_outlined, "Galareýa", context, num: 0),
      DrawerBtn(Icons.favorite_border, "Saýlananlar", context, num: 0),
      DrawerBtn(Icons.label_outline, "Arzanladyşlar", context, num: 0),
      divided,
      DrawerBtn(Icons.assignment_outlined, "Ullanyş düzgünleri", context),
      DrawerBtn(Icons.info_outline, "Biz barada", context),
      DrawerBtn(Icons.mail_outline, "Habarlaşmak", context),
      DrawerBtn(Icons.settings, "Sazlamalar", context, route: Rout.settings),
      divided,
    ]);
  }

  Divider get divided => const Divider(color: Color(0xff313131), height: 30);

  Widget get buildFooter {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      alignment: Alignment.centerLeft,
      child: const Text(
        "2022 Arzan.All right reserved",
        style: TextStyle(fontSize: 14, color: Color(0xff727272)),
      ),
    );
  }
}
