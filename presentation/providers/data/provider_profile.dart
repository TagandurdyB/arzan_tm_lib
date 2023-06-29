import 'package:provider/provider.dart';

import '/domanin/entities/profiles/user_profile_entity.dart';
import 'package:flutter/material.dart';

import '../../../domanin/usecases/profile_case.dart';

class ProfileP extends ChangeNotifier {
  final ProfileCase profileCase;
  ProfileP({required this.profileCase});

  UserProfileEntity profile = UserProfileEntity.empty;
  Future<UserProfileEntity> fillProfile(int userId) async {
    try {
      profile = await profileCase.myProfile(userId);
      // fillSubs();
      return profile;
      // notifyListeners();
    } catch (err) {
      throw ("Error ProfileP>fillProfile($userId): $err");
    }
  }

  List<UserProfileEntity> tops = [];
  Future<void> fillTops() async {
    try {
      isLast = false;
      tops = await profileCase.tops(limit, 0);
      // fillSubs();
      // return profile;

      notifyListeners();
    } catch (err) {
      throw ("Error ProfileP>fillTops(): $err");
    }
  }

  bool isLast = false;
  int limit = 12;
  Future<void> fetchTops(int offset) async {
    try {
      final objs = await profileCase.tops(limit, offset);
      if (objs.length < limit) isLast = true;
      tops.addAll(objs);
      // fillSubs();
      // return profile;
      notifyListeners();
    } catch (err) {
      throw ("Error ProfileP>fetchTops($limit , $offset): $err");
    }
  }

  static ProfileP of(BuildContext context, {bool listen = true}) =>
      Provider.of<ProfileP>(context, listen: listen);
}
