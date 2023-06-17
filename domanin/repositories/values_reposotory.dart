import '../entities/baner_entity.dart';
import '../entities/location_entity.dart';

abstract class ValuesRepository {
  Future<List<BanerEntity>> getBanners(String welayat, String page);
  Future<List<LocationEntity>> getLocations();
}
