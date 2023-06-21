import '../../domanin/entities/value_entity.dart';

import '../../domanin/entities/baner_entity.dart';

import '../../domanin/repositories/values_reposotory.dart';
import '../datasourses/remote/values_remote_datasource.dart';

class ValuesRepositoryImpl implements ValuesRepository {
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
