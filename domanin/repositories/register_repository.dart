import '../entities/register/user_http_entity.dart';
import '/domanin/entities/register/check_entity.dart';

import '../entities/register/log_in_entity.dart';
import '../entities/register/response_entity.dart';
import '../entities/register/sign_up_entity.dart';

abstract class RegisterRepository {
  Future<ResponseEntity> postSignUp(SignUpEntity obj);
  Future<ResponseEntity> postLogIn(LoginEntity obj);
  Future<ResponseEntity> postCheck(CheckEntity obj);
  Future<ResponseEntity> postRecover(UserRequestEntity obj);
  Future<UserResponseEntity> postUser(UserRequestEntity obj);
}
