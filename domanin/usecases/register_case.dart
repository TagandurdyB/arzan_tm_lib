import 'package:arzan_tm/domanin/entities/register/check_entity.dart';

import '/domanin/entities/register/log_in_entity.dart';
import '/domanin/entities/register/sign_up_entity.dart';

import '../entities/register/response_entity.dart';
import '../repositories/register_repository.dart';

class RegisterCase {
  final RegisterRepository register;
  RegisterCase(this.register);

  Future<ResponseEntity> postLogIn(LoginEntity obj) async =>
      await register.postLogIn(obj);
  Future<ResponseEntity> postSignUp(SignUpEntity obj) async =>
      await register.postSignUp(obj);
  Future<ResponseEntity> postCheck(CheckEntity obj) async =>
      await register.postCheck(obj);
}
