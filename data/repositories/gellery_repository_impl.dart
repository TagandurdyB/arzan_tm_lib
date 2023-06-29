import 'package:arzan/data/models/register/response_model.dart';
import 'package:arzan/domanin/entities/galery/img_entity.dart';

import '../../domanin/entities/galery/content_card_entity.dart';
import '../../domanin/entities/galery/video_entity.dart';
import '../../domanin/repositories/gallery_repository .dart';
import '../datasourses/remote/gallery_remote_datasource.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryRemoteDataSource galleryRemoteDataSource;
  GalleryRepositoryImpl(this.galleryRemoteDataSource);

  @override
  Future<List<ContentCardEntity>> getImgFolders(int id) async {
    return await galleryRemoteDataSource.getImgFolders(id);
  }

  @override
  Future<List<ImgEntity>> getImages(int folderID) async {
    return await galleryRemoteDataSource.getImgs(folderID);
  }

  @override
  Future<List<ContentCardEntity>> getVideos(
      int id, int limit, int offset) async {
    return await galleryRemoteDataSource.getVideos(id, limit, offset);
  }

  @override
  Future<VideoEntity> getVideo(int id) async {
    return await galleryRemoteDataSource.getVideo(id);
  }

  @override
  Future<ResponseModel> likeVideo(int id) async {
    return await galleryRemoteDataSource.likeVideo(id);
  }

  @override
  Future<ResponseModel> likeImage(int id) async {
    return await galleryRemoteDataSource.likeImage(id);
  }

  @override
  Future<ResponseModel> viewVideo(int id) async {
    return await galleryRemoteDataSource.viewVideo(id);
  }

  @override
  Future<ResponseModel> viewImage(int id) async {
    return await galleryRemoteDataSource.viewImage(id);
  }

  @override
  Future<int> badgeImgs() async {
    return await galleryRemoteDataSource.badgeImgs();
  }

  @override
  Future<int> badgeVideo() async {
    return await galleryRemoteDataSource.badgeVideo();
  }
}
