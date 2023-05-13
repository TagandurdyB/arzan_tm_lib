

import '/domanin/entities/main_page/main_page_entity.dart';

abstract class MainPageRepository{
  Future<MainPageEntity> getMainPage();
}