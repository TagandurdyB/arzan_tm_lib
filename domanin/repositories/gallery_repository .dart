import 'package:arzan/domanin/entities/galery/video_entity.dart';
import 'package:arzan/domanin/entities/register/response_entity.dart';

import '../entities/galery/content_card_entity.dart';

import '../entities/galery/img_entity.dart';

abstract class GalleryRepository {
  Future<List<ContentCardEntity>> getImgFolders(int id);
  Future<List<ImgEntity>> getImages(int id);

  Future<List<ContentCardEntity>> getVideos(int id);
  Future<VideoEntity> getVideo(int id);


  Future<ResponseEntity> likePost(int id);

  
}
