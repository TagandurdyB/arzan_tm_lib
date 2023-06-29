import 'package:arzan/presentation/views/pages/lotties/page_500.dart';

import '/presentation/providers/data/provider_profile.dart';

import '../../../../config/vars/constants.dart';
import '../../../../domanin/entities/profiles/official_profile_entity.dart';

import '../../../providers/data/hive_provider.dart';
import '/domanin/entities/profiles/user_profile_entity.dart';

import '../../../providers/data/provider_acaunt.dart';
import '/presentation/views/screens/profile/screen_expired.dart';
import '/presentation/views/screens/profile/screen_official.dart';
import '/presentation/views/screens/profile/screen_user.dart';
import 'package:flutter/material.dart';

class ProfileScreens extends StatelessWidget {
  const ProfileScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final hiveP = HiveP.of(context);
    final List<Widget> screens = [
      ScreenUser(
        obj: UserProfileEntity(
          id:hiveP.readInt(Tags.hiveUserId)??0,
          name: hiveP.readStr(Tags.hiveName) ?? "user",
          phone: hiveP.readStr(Tags.hivePhone) ?? "phone",
          avatarImg: hiveP.readStr(Tags.hiveAvatarImg),
          coin: 1285,
          confirmed: 94,
          expected: 150,
          notAccepted: 267,
          isEmpty: false,
        ),
      ),
      ScreenOfficial(
        obj: OfficialProfileEntity(
          images: [
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCQwn4a_TR68qjoCIrzfFtBnUmnd0KvnsG7A&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCQwn4a_TR68qjoCIrzfFtBnUmnd0KvnsG7A&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCQwn4a_TR68qjoCIrzfFtBnUmnd0KvnsG7A&usqp=CAU",
          ],
          avatarImg:
              "https://play-lh.googleusercontent.com/326hZ9pubFetmymUcBe3ZX0gTG_DLdjiDdkleC04Gft-YtiJrBzGrQPNJGqghy6Nfg=w240-h480-rw",
          name: "100haryt.com",
          locations: ["Aşgabat", "Mary", "Lebap"],
          about: '''Ваш комфорт, наше удовольствие!
Мы как интернет-магазин 100haryt предлагаем вам товары на любой вкуc. Компьютеры, телефоны, малая бытовая техника, товары дaasdasd..''',
          followers: 150,
          followUps: 267,
          likeCount: 94,
          videos: 458,
          pictures: 358,
          comments: 265,
          coin: 1285,
        ),
      ),
      ScreenExpired(
        obj: OfficialProfileEntity(
          images: [
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCQwn4a_TR68qjoCIrzfFtBnUmnd0KvnsG7A&usqp=CAU",
          ],
          avatarImg:
              "https://play-lh.googleusercontent.com/326hZ9pubFetmymUcBe3ZX0gTG_DLdjiDdkleC04Gft-YtiJrBzGrQPNJGqghy6Nfg=w240-h480-rw",
          name: "100haryt.com",
          locations: ["Aşgabat", "Mary", "Lebap"],
          about: '''Ваш комфорт, наше удовольствие!
Мы как интернет-магазин 100haryt предлагаем вам товары на любой вкуc. Компьютеры, телефоны, малая бытовая техника, товары дaasdasd..''',
          followers: 150,
          followUps: 267,
          likeCount: 94,
          videos: 458,
          pictures: 358,
          comments: 265,
          coin: 1285,
        ),
      ),
    ];
    final providA = AcauntP.of(context);
    final hiveDo = HiveP.of(context, listen: false);
    return FutureBuilder<UserProfileEntity>(
      future: ProfileP.of(context, listen: false)
          .fillProfile(hiveP.readInt(Tags.hiveUserId) ?? 0),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("error acconut err:=${snapshot.error}");
          return Page500();
        } else if (snapshot.hasData) {
          // return screens[providA.profileIndex(context)];
          return ScreenUser(obj: snapshot.data!);
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.green,
          ));
        }
      },
    );
  }
}
