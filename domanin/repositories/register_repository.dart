import '../entities/register/user_http_entity.dart';
import '/domanin/entities/register/check_entity.dart';

import '../entities/register/log_in_entity.dart';
import '../entities/register/response_entity.dart';
import '../entities/register/sign_up_entity.dart';

abstract class RegisterRepository {
  //SignUp===============================
  Future<ResponseEntity> postSignUp(SignUpEntity obj);
  Future<ResponseEntity> postLogIn(LoginEntity obj);
  //Login===============================

  Future<ResponseEntity> postCheck(CheckEntity obj);
  Future<UserResponseEntity> postUser(UserRequestEntity obj);

  //Recover===============================
  Future<ResponseEntity> postExist(UserRequestEntity obj);
  Future<ResponseEntity> postCheckRecover(CheckEntity obj);
  Future<ResponseEntity> postRecover(UserRequestEntity obj);

  // Future<ResponseEntity> postCheckRecover(CheckEntity obj) async =>
  //     await register.postCheck(obj);
  // Future<ResponseEntity> postRecover(UserRequestEntity obj) async =>
  //     await register.postExist(obj);
}
