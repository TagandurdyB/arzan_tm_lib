

import '/domanin/entities/profiles/user_profile_entity.dart';

abstract class ProfileRepository {
  Future<UserProfileEntity> myAccount(int userId);
  Future<List<UserProfileEntity>> tops(int limit, int offset);
}