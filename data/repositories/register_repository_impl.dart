import '../../domanin/entities/register/response_entity.dart';
import '/data/models/register/sign_up_model.dart';

import '/data/models/register/log_in_model.dart';

import '/domanin/entities/register/sign_up_entity.dart';

import '/domanin/entities/register/log_in_entity.dart';

import '../../domanin/repositories/register_repository.dart';
import '../datasourses/remote/register_remote_datasource.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource mainPageRemoteDataSource;
  RegisterRepositoryImpl(this.mainPageRemoteDataSource);
  @override
  Future<ResponseEntity> postLogIn(LogInEntity obj) async {
    final model =
        await mainPageRemoteDataSource.postLogIn(LogInModel.fromEntity(obj));
    return model;
  }

  @override
  Future<ResponseEntity> postSignUp(SignUpEntity obj) async {
    final model =
        await mainPageRemoteDataSource.postSignUp(SignUpModel.fromEntity(obj));
    return model;
  }
}
