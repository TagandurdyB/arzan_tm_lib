import '../entities/baner_entity.dart';

abstract class BannerRepository {
  Future<List<BanerEntity>> getBanner(String welayat, String page);
}
