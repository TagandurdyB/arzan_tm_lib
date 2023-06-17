import '../entities/location_entity.dart';
import '../repositories/values_reposotory.dart';
import '../entities/baner_entity.dart';

class ValuesCase {
  final ValuesRepository repository;
  ValuesCase(this.repository);

  Future<List<BanerEntity>> getBanners(String welayat, String page) async =>
      await repository.getBanners(welayat, page);

  Future<List<LocationEntity>> getLocation() async =>
      await repository.getLocations();
}
