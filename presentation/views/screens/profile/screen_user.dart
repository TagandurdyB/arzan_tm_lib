// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:arzan_tm/presentation/views/widgets/arzan_coin.dart';
import 'package:arzan_tm/presentation/views/widgets/next_btn.dart';
import 'package:arzan_tm/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';
import '/presentation/views/widgets/my_container.dart';

import '../../../../domanin/entities/profiles/user_profile_entity.dart';
import '../../../providers/view/provider_theme.dart';
import '/presentation/views/widgets/custom_avatar.dart';

import '../../../../config/services/my_size.dart';
import '../../../../config/vars/constants.dart';
import '../../../providers/data/hive_provider.dart';

class ScreenUser extends StatelessWidget {
  final UserProfileEntity obj;
  ScreenUser({required this.obj, super.key});

  late BuildContext context;
  final arentir = MySize.arentir;
  late HiveP hiveP;
  @override
  Widget build(BuildContext context) {
    hiveP = HiveP.of(context, listen: false);
    this.context = context;
    return ListView(children: [
      buildTopBar,
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
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                height: MySize.width * 0.55,
                width: MySize.width,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: obj.avatarImg == null
                      ? Image.asset("assets/logo_png.png")
                      : ShimmerImg(imageUrl: obj.avatarImg!),
                ),
              ),
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
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CustomAvatar(
                    isShadow: true,
                    imgUrl: obj.avatarImg ?? "",
                    content: obj.avatarImg == null
                        ? Container(
                            color: Colors.green,
                            child: Image.asset("assets/logo_png.png"))
                        : null,
                    borderColor: Colors.white,
                    radius: arentir * 0.25,
                    bgColor: Colors.white,
                  ),
                  MyContainer(
                    margin: EdgeInsets.all(arentir * 0.01),
                    onTap: () {},
                    width: arentir * 0.05,
                    height: arentir * 0.05,
                    shape: arentir * 0.01,
                    boxShadow: ThemeP.of(context).shadows.all,
                    child: Icon(
                      Icons.edit_square,
                      color: const Color(0xff0EC243),
                      size: arentir * 0.04,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget get buildContent => Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              obj.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: arentir * 0.04),
            ),
            const SizedBox(height: 10),
            iconGroup(Icons.phone, obj.phone, const Color(0xff727272)),
            const SizedBox(height: 10),
            iconGroup(Icons.location_on_outlined,
                hiveP.readStr(Tags.hiveWelayat)!, const Color(0xff727272)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: arentir * 0.08),
              child: buildStatistics,
            ),
            NextBtn(
              func: () {},
              text: "Resmi hasap aç",
            ),
            SizedBox(height: arentir * 0.03),
            NextBtn(
              bgColor: const Color(0xffF9FAFC),
              borderColor: const Color(0xffE5E5E5),
              func: () {},
              // text: "Resmi hasap aç",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ArzanCoin(radius: 20),
                  SizedBox(width: arentir * 0.02),
                  Text(
                    "${obj.coin}",
                    style: TextStyle(fontSize: MySize.arentir * 0.04),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget iconGroup(IconData iconD, String text, Color col) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconD, color: col),
        Text(
          text,
          style: TextStyle(color: col),
        ),
      ],
    );
  }

  Widget get buildStatistics => Row(
        // alignment: WrapAlignment.center,
        // crossAxisAlignment: WrapCrossAlignment.center,
        // spacing: arentir * 0.02,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildCounter(obj.expected, "Garaşylýar"),
          vDivider,
          buildCounter(obj.notAccepted, "Kabul edilmedi"),
          vDivider,
          buildCounter(obj.confirmed, "Tassyklandy"),
        ],
      );

  Widget get vDivider => Container(
        width: 2,
        color: const Color(0xffE5E5E5),
        height: arentir * 0.14,
      );

  Widget buildCounter(int count, String text) => SizedBox(
        // color: Colors.red,
        height: arentir * 0.15,
        child: Column(
          children: [
            Text(
              "$count",
              style: TextStyle(
                  fontSize: arentir * 0.045, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: arentir * 0.02),
            Text(
              text,
              style: const TextStyle(color: Color(0xff999999)),
            ),
          ],
        ),
      );
}
