// ignore_for_file: must_be_immutable
import '../../../config/services/my_size.dart';
import 'package:flutter/material.dart';
import '../../../config/routes/my_route.dart';
import '../../providers/data/provider_acaunt.dart';
import '../widgets/drawer_btn.dart';
import '../widgets/my_container.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  late BuildContext context;
  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Drawer(
      backgroundColor: Colors.transparent,
      child: SafeArea(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius:
                BorderRadius.horizontal(right: Radius.circular(arentir * 0.03)),
          ),
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
      ),
    );
  }

  Widget get buildLogin {
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, Rout.acaunt),
      child: Container(
        alignment: Alignment.center,
        color: const Color(0xff00C52B),
        width: double.infinity,
        height: 77,
        child: Row(children: [buildIcon, buildText]),
      ),
    );
  }

  Widget get buildIcon {
    return MyContainer(
        shape: 30,
        borderColor: Colors.white,
        borderWidth: 1,
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
    final providA = AcauntP.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      DrawerBtn(Icons.star_border, "Top hasaplar", context, num: 324),
      DrawerBtn(Icons.favorite_border, "Saýlananlar", context, num: 324),
      DrawerBtn(Icons.label_outline, "Arzanladyşlar", context, num: 324),
      DrawerBtn(Icons.image_outlined, "Foto", context, num: 324),
      DrawerBtn(Icons.video_collection_outlined, "Wideo", context, num: 324),
      DrawerBtn(
          Icons.star_border, icon: buildStar(), "Resmiler", context, num: 324),
      divided,
      DrawerBtn(Icons.location_on_outlined, "Welaýat saýla", context),
      DrawerBtn(Icons.bookmark_border, "Bellenenler", context,
          visible: providA.isSing),
      DrawerBtn(Icons.settings_suggest_outlined, "Sazlamalar", context,
          route: Rout.settings),
      divided,
      DrawerBtn(Icons.mail_outline, "Habarlaşmak", context,
          visible: providA.isSing),
      DrawerBtn(Icons.share_outlined, "Paýlaşmak", context,
          visible: providA.isSing),
    ]);
  }

  Container buildStar() {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffB47D3F),
          border: Border.all(color: const Color(0xffE2BD83), width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: const Icon(
        Icons.star,
        color: Color(0xffE2BD83),
        size: 20,
      ),
    );
  }

  Divider get divided => const Divider(color: Color(0xff313131), height: 30);

  Widget get buildFooter {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
          ),
          width: 200,
          // height: 30,
          child: DrawerBtn(
            colorElements: Colors.red,
            Icons.login_outlined,
            "Ulgamdan çykmak",
            context,
            visible: AcauntP.of(context).isSing,
            isRestart: true,
            route: Rout.home,
            onTap: () => AcauntP.of(context, listen: false).logOut,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          alignment: Alignment.centerLeft,
          child: const Text(
            "2022 Arzan.All right reserved",
            style: TextStyle(fontSize: 14, color: Color(0xff727272)),
          ),
        ),
      ],
    );
  }
}
