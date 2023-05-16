import '/domanin/entities/galery/video_card_entity.dart';

import '/domanin/entities/galery/gallery_entity.dart';

import '../entities/galery/img_card_entity.dart';
import '../repositories/gallery_repository .dart';

class GalleryCase {
  final GalleryRepository repository;
  GalleryCase(this.repository);
  Future<GalleryEntity> getImages() async => await repository.getImages();

  Future<List<ImgCardEntity>> getImgEntitis() async =>
      await repository.getImgEntitis();

  Future<GalleryEntity> getVideos() async => await repository.getVideos();

    Future<List<VideoCardEntity>> getVideoEntitis() async =>
      await repository.getVideoEntitis();
}
