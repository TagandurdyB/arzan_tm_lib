import '../entities/baner_entity.dart';
import '../entities/location_entity.dart';

abstract class ValuesRepository {
  Future<List<BanerEntity>> getBanners(int welayat, int page);
  Future<List<LocationEntity>> getLocations();
}
