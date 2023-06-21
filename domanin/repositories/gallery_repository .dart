import 'package:arzan/domanin/entities/galery/video_entity.dart';

import '/domanin/entities/galery/gallery_entity.dart';

import '../entities/galery/img_card_entity.dart';

abstract class GalleryRepository {
  // Future<GalleryEntity> getImages();
  // Future<List<ImgCardEntity>> getImgEntitis();

  Future<List<VideoCardEntity>> getVideos();
  Future<VideoEntity> getVideo(int id);

}
