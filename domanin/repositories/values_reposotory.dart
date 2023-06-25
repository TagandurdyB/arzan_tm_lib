import '../entities/baner_entity.dart';
import '../entities/value_entity.dart';

abstract class ValuesRepository {
  Future<List<BanerEntity>> getBanners(int welayat, int page);
  Future<List<ValueEntity>> getLocations();
  Future<List<ValueEntity>> getVideoCategories();
  Future<List<ValueEntity>> getImgCategories();
  
}
