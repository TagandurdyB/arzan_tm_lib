

import '../../domanin/repositories/gallery_repository .dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final ValuesRemoteDataSource valuesRemoteDataSource;
  ValuesRepositoryImpl(this.valuesRemoteDataSource);

  @override
  Future<List<BanerEntity>> getBanners(int welayat, int page) async {
    return await valuesRemoteDataSource.getBanners(welayat, page);
  }

  @override
  Future<List<ValueEntity>> getLocations() async {
    return await valuesRemoteDataSource.getLocations();
  }
}
