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
  Future<List<ContentCardEntity>> getVideos(int id) async {
    return await galleryRemoteDataSource.getVideos(id);
  }

  @override
  Future<VideoEntity> getVideo(int id) async {
    return await galleryRemoteDataSource.getVideo(id);
  }

    Future<ResponseModel> likePost(int id) async {
    return await galleryRemoteDataSource.likePost(id);
  }
}
