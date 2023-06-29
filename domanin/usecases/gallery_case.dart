import 'package:arzan/domanin/entities/register/response_entity.dart';

import '../entities/galery/content_card_entity.dart';
import '../entities/galery/video_entity.dart';

import '../entities/galery/img_entity.dart';
import '../repositories/gallery_repository .dart';

class GalleryCase {
  final GalleryRepository repository;
  GalleryCase(this.repository);

  Future<List<ContentCardEntity>> getImgFolders(int id) async =>
      await repository.getImgFolders(id);
  Future<List<ImgEntity>> getImages(int folderID) async =>
      await repository.getImages(folderID);

  Future<List<ContentCardEntity>> getVideos(int id, int limit, int offset) async =>
      await repository.getVideos(id, limit, offset);
  Future<VideoEntity> getVideo(int id) async => await repository.getVideo(id);

  Future<ResponseEntity> likeVidoe(int id) async =>
      await repository.likeVideo(id);

    Future<int> badgeVideo()async=>await repository.badgeVideo();  
    Future<int> badgeImgs()async=>await repository.badgeImgs();  
}
