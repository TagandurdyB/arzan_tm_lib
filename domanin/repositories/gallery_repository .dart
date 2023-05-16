import '/domanin/entities/galery/video_card_entity.dart';

import '/domanin/entities/galery/gallery_entity.dart';

import '../entities/galery/img_card_entity.dart';

abstract class GalleryRepository {
  Future<GalleryEntity> getImages();
  Future<List<ImgCardEntity>> getImgEntitis();

  Future<GalleryEntity> getVideos();
  Future<List<VideoCardEntity>> getVideoEntitis();

}
