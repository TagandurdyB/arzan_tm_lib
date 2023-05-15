import '/domanin/entities/register/log_in_entity.dart';
import '/domanin/entities/register/sign_up_entity.dart';

import '../entities/register/response_entity.dart';
import '../repositories/register_repository.dart';

class RegisterCase {
  final RegisterRepository register;
  RegisterCase(this.register);

  Future<ResponseEntity> postLogIn(LogInEntity obj) async =>
      await register.postLogIn(obj);
  Future<ResponseEntity> postSignUp(SignUpEntity obj) async =>
      await register.postSignUp(obj);
}
