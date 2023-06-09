import '../../../config/vars/constants.dart';
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

  Future<ResponseEntity> logIn(LoginEntity obj) async {
    final ResponseEntity entity = await registerCase.postLogIn(obj);

    if (entity.status == true) {
      _isSign = true;
    }
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

//=================================================================
  int profileIndex(BuildContext context) {
    final String? hiveRole =
        HiveP.of(context, listen: false).readStr(Tags.hiveRole);
    if (hiveRole != null) {
      if (hiveRole == "user") {
        return 0;
      } else if (hiveRole == "official") {
        return 1;
      } else if (hiveRole == "expired") {
        return 2;
      }
    }
    return 0;
  }
//=================================================================

  static AcauntP of(BuildContext context, {bool listen = true}) =>
      Provider.of<AcauntP>(context, listen: listen);
}
