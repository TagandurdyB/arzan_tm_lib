// ignore_for_file: must_be_immutable

import 'dart:ui';

import '../../../../config/routes/my_route.dart';
import '../../../../config/vars/formater.dart';
import '../../widgets/picture_view.dart';
import '../../../../domanin/entities/profiles/official_profile_entity.dart';
import '/presentation/views/widgets/arzan_coin.dart';
import '/presentation/views/widgets/next_btn.dart';
import 'package:flutter/material.dart';

import '/presentation/views/widgets/custom_avatar.dart';

import '../../../../config/services/my_size.dart';
import '../../../providers/data/hive_provider.dart';

class ProfileExpired extends StatelessWidget {
  final OfficialProfileEntity obj;
  ProfileExpired({required this.obj, super.key});

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
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              height: MySize.width * 0.6,
              width: MySize.width,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: obj.images == null || obj.images!.isEmpty
                    ? Image.asset("assets/logo_png.png")
                    : PictureView(images: obj.images!),
              ),
            ),
            Positioned(
              top: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Container(
                    height: kToolbarHeight,
                    width: MySize.width,
                    color: Colors.black26,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        IconButton(
                            onPressed: () {},
                            color: Colors.white,
                            icon: const Icon(Icons.more_vert))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              child: CustomAvatar(
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
            iconGroup(Icons.location_on_outlined,
                Formater.locations(obj.locations), const Color(0xff727272)),
            buildAbout,
            Padding(
              padding: EdgeInsets.symmetric(vertical: arentir * 0.08),
              child: buildStatistics,
            ),
            NextBtn(
              func: () {
                Navigator.pushNamed(context, Rout.buyService);
              },
              text: "Hyzmat satyn almak",
            ),
            SizedBox(height: arentir * 0.03),
            NextBtn(
              bgColor: const Color(0xffF9FAFC),
              borderColor: const Color(0xffE5E5E5),
              func: () {
                Navigator.pushNamed(context, Rout.acaunt);
              },
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

  Widget get buildAbout => Container(
        height: arentir * 0.2,
        width: MySize.width,
        // color: Colors.red,
        margin: EdgeInsets.only(top: arentir * 0.04),
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 02],
              tileMode: TileMode.mirror,
              colors: [Colors.white, Colors.transparent]).createShader(bounds),
          child: Text(
            obj.about,
            style: TextStyle(
                fontSize: arentir * 0.04, overflow: TextOverflow.ellipsis),
            maxLines: 4,
            textAlign: TextAlign.center,
          ),
        ),
      );

  Widget get buildStatistics => Column(
        children: [
          buildCounterRow(
            [obj.followers, obj.followUps, obj.likeCount],
            ["Yzarlaýanlar", "Yzarlamalar", "Like sany"],
          ),
          SizedBox(height: arentir * 0.05),
          buildCounterRow(
            [obj.videos, obj.pictures, obj.comments],
            ["Wideolar", "Suratlar", "Teswirler"],
          ),
        ],
      );

  Row buildCounterRow(List<int> counts, List<String> texts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildCounter(counts[0], texts[0]),
        vDivider,
        buildCounter(counts[1], texts[1]),
        vDivider,
        buildCounter(counts[2], texts[2]),
      ],
    );
  }

  Widget get vDivider => Container(
        width: 2,
        color: const Color(0xffE5E5E5),
        height: arentir * 0.14,
      );

  Widget buildCounter(int count, String text) => Expanded(
        child: SizedBox(
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
        ),
      );
}
