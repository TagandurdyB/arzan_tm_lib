import '/domanin/entities/main_page/baner_entity.dart';

abstract class BannerRepository {
  Future<List<BanerEntity>> getBanner(String welayat, String page);
}
