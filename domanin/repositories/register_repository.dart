import '../entities/register/log_in_entity.dart';
import '../entities/register/response_entity.dart';
import '../entities/register/sign_up_entity.dart';

abstract class RegisterRepository{
  Future<ResponseEntity> postSignUp(SignUpEntity obj);
  Future<ResponseEntity> postLogIn(LogInEntity obj);
}