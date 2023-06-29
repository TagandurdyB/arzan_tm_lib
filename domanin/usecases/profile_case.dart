import '../entities/profiles/user_profile_entity.dart';
import '/domanin/repositories/profile_repository.dart';

class ProfileCase {
  final ProfileRepository profiler;
  ProfileCase(this.profiler);

// Future<MainPageEntity> get() async => await repository.getMainPage();
  Future<UserProfileEntity> myProfile(int userId) async =>
      await profiler.myAccount(userId);

  Future<List<UserProfileEntity>> tops(int limit, int offset) async =>
      await profiler.tops(limit, offset);
}
