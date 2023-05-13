import '/domanin/entities/main_page/main_page_entity.dart';

import '/data/datasourses/remote/main_page_remote_datasource.dart';
import '../../domanin/repositories/main_page_repository.dart';

class MainPageRepositoryImpl implements MainPageRepository {
  final MainPageRemoteDataSource mainPageRemoteDataSource;
  MainPageRepositoryImpl(this.mainPageRemoteDataSource);
  @override
  Future<MainPageEntity> getMainPage() async {
    return await mainPageRemoteDataSource.getMainPage();
  }
}
