import 'package:arzan_tm/domanin/entities/register/sign_up_entity.dart';

import '/domanin/entities/register/response_entity.dart';

import '/domanin/entities/register/log_in_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domanin/usecases/register_case.dart';

class AcauntP extends ChangeNotifier {
  final RegisterCase registerCase;
  AcauntP({required this.registerCase});

  bool _isSign = false;
  bool get isSing => _isSign;

  bool? _isSuccess;
  bool? get isSuccess => _isSuccess;

  Future<ResponseEntity> signUp(SignUpEntity obj) async {
    final ResponseEntity entity = await registerCase.postSignUp(obj);
    return entity;
  }

  void get logOut {
    _isSign = false;
    notifyListeners();
  }

  Future<ResponseEntity> logIn(LogInEntity obj) async {
    final ResponseEntity entity = await registerCase.postLogIn(obj);

    if (entity.succsess == true) {
      _isSign = true;
    }
    notifyListeners();
    return entity;
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

  static AcauntP of(BuildContext context, {bool listen = true}) =>
      Provider.of<AcauntP>(context, listen: listen);
}
