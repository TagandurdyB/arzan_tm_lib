import '/domanin/entities/main_page/main_page_entity.dart';

import '../repositories/main_page_repository.dart';

class MainPageCase {
  final MainPageRepository repository;
  MainPageCase(this.repository);

  Future<MainPageEntity> get() async => await repository.getMainPage();
}
