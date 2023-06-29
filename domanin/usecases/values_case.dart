import '../entities/value_entity.dart';
import '../repositories/values_reposotory.dart';
import '../entities/baner_entity.dart';

class ValuesCase {
  final ValuesRepository repository;
  ValuesCase(this.repository);

  Future<List<BanerEntity>> getBanners(int welayat, int page, int category) async =>
      await repository.getBanners(welayat, page, category);

  Future<List<ValueEntity>> getLocation() async =>
      await repository.getLocations();

  Future<List<ValueEntity>> getVideoCategories() async =>
      await repository.getVideoCategories();

  Future<List<ValueEntity>> getImgCategories() async =>
      await repository.getImgCategories();
}
