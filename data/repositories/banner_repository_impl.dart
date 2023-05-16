import '/domanin/entities/main_page/baner_entity.dart';

import '../../domanin/repositories/banner_reposotory.dart';
import '../datasourses/remote/banner_remote_datasource.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDataSource bannerRemoteDataSource;
  BannerRepositoryImpl(this.bannerRemoteDataSource);
  @override
  Future<List<BanerEntity>> getBanner(String welayat, String page) async {
    return await bannerRemoteDataSource.getBanners(welayat, page);
  }
}
