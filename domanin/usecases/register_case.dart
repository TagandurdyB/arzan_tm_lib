import '../entities/register/user_http_entity.dart';
import '/domanin/entities/register/check_entity.dart';

import '/domanin/entities/register/log_in_entity.dart';
import '/domanin/entities/register/sign_up_entity.dart';

import '../entities/register/response_entity.dart';
import '../repositories/register_repository.dart';

class RegisterCase {
  final RegisterRepository register;
  RegisterCase(this.register);

  Future<ResponseEntity> postSignUp(SignUpEntity obj) async =>
      await register.postSignUp(obj);
      
  Future<ResponseEntity> postCheck(CheckEntity obj) async =>
      await register.postCheck(obj);
  Future<ResponseEntity> postRecover(UserRequestEntity obj) async =>
      await register.postRecover(obj);
      
  Future<UserResponseEntity> postLogIn(LoginEntity obj) async =>
      await register.postLogIn(obj);
  Future<UserResponseEntity> postUser(UserRequestEntity obj) async =>
      await register.postUser(obj);
}
