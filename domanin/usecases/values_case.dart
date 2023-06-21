import '../entities/value_entity.dart';
import '../repositories/values_reposotory.dart';
import '../entities/baner_entity.dart';

class ValuesCase {
  final ValuesRepository repository;
  ValuesCase(this.repository);

  Future<List<BanerEntity>> getBanners(int welayat, int page) async =>
      await repository.getBanners(welayat, page);

  Future<List<ValueEntity>> getLocation() async =>
      await repository.getLocations();
}
