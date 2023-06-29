import '/presentation/views/scaffold/no_app_bar_scaffold.dart';

import '/presentation/views/screens/profile_view/profile_expired.dart';

import '../../providers/data/provider_acaunt.dart';
import '../screens/profile_view/profile_official.dart';
import '../../../domanin/entities/profiles/official_profile_entity.dart';

import '../screens/profile_view/profile_user.dart';
import '/domanin/entities/profiles/user_profile_entity.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String role;
  ProfilePage({required this.role, super.key});

  final List<Widget> _screens = [
    ProfileUser(
      obj: UserProfileEntity(
        id:0,
        name: "Julian Herbst",
        phone: "+99361000000",
        avatarImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS24ZGizhBdEEM45p1jTB-3BiOENqIB5sIpjMs5c4WqmEIWXvcI058bZDnXhrELsAoYbrE&usqp=CAU",
        coin: 1285,
        confirmed: 94,
        expected: 150,
        notAccepted: 267,
        isEmpty: false,
      ),
    ),
    ProfileOfficial(
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
    ProfileExpired(
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

  @override
  Widget build(BuildContext context) {
    final providA = AcauntP.of(context);
    return ScaffoldNo(body: _screens[providA.profileIndexByName(role)]);
  }
}
