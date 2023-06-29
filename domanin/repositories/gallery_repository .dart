import 'package:arzan/domanin/entities/galery/video_entity.dart';
import 'package:arzan/domanin/entities/register/response_entity.dart';

import '../entities/galery/content_card_entity.dart';

import '../entities/galery/img_entity.dart';

abstract class GalleryRepository {
  Future<List<ContentCardEntity>> getImgFolders(int id);
  Future<List<ImgEntity>> getImages(int id);

  Future<List<ContentCardEntity>> getVideos(int id, int limit, int offset);
  Future<VideoEntity> getVideo(int id);

  Future<ResponseEntity> likeVideo(int id);
  Future<ResponseEntity> likeImage(int id);

  Future<ResponseEntity> viewVideo(int id);
  Future<ResponseEntity> viewImage(int id);

  Future<int> badgeVideo();
  Future<int> badgeImgs();
}
