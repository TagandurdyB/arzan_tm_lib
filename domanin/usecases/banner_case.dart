import '../repositories/banner_reposotory.dart';
import '../entities/baner_entity.dart';

class BannerCase {
  final BannerRepository repository;
  BannerCase(this.repository);

  Future<List<BanerEntity>> get(String welayat, String page) async =>
      await repository.getBanner(welayat, page);
}
