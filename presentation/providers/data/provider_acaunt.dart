import '../../../config/vars/constants.dart';
import '../../../domanin/entities/register/user_http_entity.dart';
import '/domanin/entities/register/check_entity.dart';
import '/domanin/entities/register/sign_up_entity.dart';

import '/domanin/entities/register/response_entity.dart';

import '/domanin/entities/register/log_in_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domanin/usecases/register_case.dart';
import 'hive_provider.dart';

class AcauntP extends ChangeNotifier {
  final RegisterCase registerCase;
  AcauntP({required this.registerCase});

  bool _isSign = false;
  bool get isSing => _isSign;

  Future<ResponseEntity> signUp(SignUpEntity obj) async {
    final ResponseEntity entity = await registerCase.postSignUp(obj);
    return entity;
  }

  Future<ResponseEntity> checkActivate(CheckEntity obj) async {
    final ResponseEntity entity = await registerCase.postCheck(obj);
    return entity;
  }

  Future<UserResponseEntity> checkUser(UserRequestEntity obj) async {
    final UserResponseEntity entity = await registerCase.postUser(obj);
    return entity;
  }

  Future<ResponseEntity> recover(UserRequestEntity obj) async {
    final ResponseEntity entity = await registerCase.postRecover(obj);
    return entity;
  }

  Future<ResponseEntity> logInPost(LoginEntity obj) async {
    final ResponseEntity entity = await registerCase.postLogIn(obj);
    notifyListeners();
    return entity;
  }

  void get logIned {
    _isSign = true;
    notifyListeners();
  }

  void get logOut {
    _isSign = false;
    notifyListeners();
  }

  ResponseEntity signEntity = ResponseEntity.empty;
  ResponseEntity loginEntity = ResponseEntity.empty;
  //MainPageEntity entity = MainPageEntity.frowJson(api);

  int _screenIndex = 0;
  int get screenIndex => _screenIndex;
  void changeScreen(int index) {
    _screenIndex = index;
    notifyListeners();
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int _signIndex = 0;
  int get signIndex => _signIndex;
  void changeSign(int index) {
    _signIndex = index;
    pageController.animateToPage(_signIndex,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    notifyListeners();
  }

//=================================================================
  int profileIndexByName(String role) {
    switch (role) {
      case "user":
        return 0;
      case "official":
        return 1;
      case "expired":
        return 2;
    }
    return 0;
  }

  //===
  int profileIndex(BuildContext context) {
    final String? hiveRole =
        HiveP.of(context, listen: false).readStr(Tags.hiveRole);
    if (hiveRole != null) {
      return profileIndexByName(hiveRole);
    }
    return 0;
  }

//User Info Save===================================================
  void saveUserInfo(BuildContext context, UserResponseEntity obj) {
    // final obj = userEntity;
    final hiveP = HiveP.of(context, listen: false);
    if (!obj.isEmpty) {
      hiveP.saveInt(obj.id, Tags.hiveId);
      hiveP.saveStr(obj.email ?? "", Tags.hiveEmail);
      if (obj.token != "") hiveP.saveStr(obj.token, Tags.hiveToken);
      hiveP.saveStr(obj.role, Tags.hiveRole);
      hiveP.saveStr(obj.name, Tags.hiveName);
      hiveP.saveStr(obj.profilePhoto ?? "", Tags.hiveAvatarImg);
    } else {
      logOut;
      hiveP.saveInt(null, Tags.hiveId);
      hiveP.saveStr(null, Tags.hiveEmail);
      hiveP.saveStr(null, Tags.hiveToken);
      hiveP.saveStr(null, Tags.hiveRole);
      hiveP.saveStr(null, Tags.hiveName);
      hiveP.saveStr(null, Tags.hiveAvatarImg);
    }
  }

  // void autoCheckUser(BuildContext context) async {
  //   final hiveP = HiveP.of(context, listen: false);
  //   final token = hiveP.readStr(Tags.hiveToken);
  //   final phone = hiveP.readStr(Tags.hivePhone);
  //   if (token != null && phone != null) {
  //     userEntity =
  //         await checkUser(UserRequestEntity(phone: phone, token: token));
  //   }
  //   notifyListeners();
  // }

//=================================================================

  static AcauntP of(BuildContext context, {bool listen = true}) =>
      Provider.of<AcauntP>(context, listen: listen);
}
