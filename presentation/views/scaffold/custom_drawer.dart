// ignore_for_file: must_be_immutable
import 'package:arzan/presentation/providers/data/discount_data_provider.dart';
import 'package:arzan/presentation/providers/data/video_data_provider.dart';
import 'package:arzan/presentation/providers/view/provider_navigation.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../config/services/my_size.dart';
import 'package:flutter/material.dart';
import '../../../config/routes/my_route.dart';
import '../../../config/vars/constants.dart';
import '../../providers/data/hive_provider.dart';
import '../../providers/data/provider_acaunt.dart';
import '../../providers/data/provider_gallery.dart';
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
      // backgroundColor: Colors.transparent,
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
    return GestureDetector(
      onTap: () {
        final role =
            HiveP.of(context, listen: false).readStr(Tags.hiveRole) != null;
        if (role) {
          Navigator.pushNamed(context, Rout.acaunt);
        } else {
          Navigator.pop(context);
          ProviderNav.of(context, listen: false).changeScreen(4);
        }
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.green.shade100,
        width: double.infinity,
        height: 77,
        child: Row(children: [
          buildIcon,
          const Text(
            "Ulgama gir",
            style: TextStyle(fontSize: 15, color: Colors.black),
          )
        ]),
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

  Widget get buildContent {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      DrawerBtn(Icons.star_border, "Top hasaplar", context,
          num: null, route: Rout.tops),
      DrawerBtn(Icons.favorite_border, "Saýlananlar", context,
          num: null, 
          onTap: (){
 Fluttertoast.showToast(
              msg: "Under development!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          },
          ),
      DrawerBtn(Icons.label_outline, "Arzanladyşlar", context,
          num: DiscountDataP.of(context).badge, route: Rout.discounts),
      DrawerBtn(Icons.image_outlined, "Foto", context,
          num: GalleryP.of(context).badge, route: Rout.images),
      DrawerBtn(Icons.video_collection_outlined, "Wideo", context,
          num: VideoDataP.of(context).badge, route: Rout.videos),
      DrawerBtn(
          Icons.star_border,
          icon: buildStar(),
          "Resmiler",
          context,
          num: null,
          route: Rout.officials),
      divided,
      DrawerBtn(
        Icons.location_on_outlined,
        "Welaýat saýla",
        context,
        isRestart: true,
        route: Rout.region,
      ),
      DrawerBtn(Icons.bookmark_border, "Bellenenler", context,
          route: Rout.favorites),
      DrawerBtn(Icons.settings_suggest_outlined, "Sazlamalar", context,
          route: Rout.settings),
      divided,
      DrawerBtn(Icons.mail_outline, "Habarlaşmak", context,
          route: Rout.contact),
      DrawerBtn(Icons.share_outlined, "Paýlaşmak", context, route: Rout.share),
    
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
            onTap: () {
              HiveP.of(context, listen: false).saveBool(false, Tags.isLogin);
              AcauntP.of(context, listen: false).logOut;
            },
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
