import '../../domanin/entities/profiles/user_profile_entity.dart';
import '/data/datasourses/remote/profile_remote_datasource.dart';

import '../../domanin/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemopteDataSource;
  ProfileRepositoryImpl(this.profileRemopteDataSource);
  @override
  Future<UserProfileEntity> myAccount(int userId) async {
    //  Future<UserProfileModel> accountFetch(int userId);
    final model = await profileRemopteDataSource.accountFetch(userId);
    return model;
  }

  @override
  Future<List<UserProfileEntity>> tops(int limit, int offset) async {
    //  Future<UserProfileModel> accountFetch(int userId);
    final model = await profileRemopteDataSource.tops(limit,  offset);
    return model;
  }

}
