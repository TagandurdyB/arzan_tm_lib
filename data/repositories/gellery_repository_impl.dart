import '../../domanin/entities/galery/gallery_entity.dart';
import '../../domanin/entities/galery/video_entity.dart';
import '../../domanin/repositories/gallery_repository .dart';
import '../datasourses/remote/gallery_remote_datasource.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryRemoteDataSource galleryRemoteDataSource;
  GalleryRepositoryImpl(this.galleryRemoteDataSource);

  // @override
  // Future<GalleryEntity> getImages() async {
  //   return await galleryRemoteDataSource.ge(welayat, page);
  // }

  // @override
  // Future<List<BanerEntity>> getBanners(int welayat, int page) async {
  //   return await galleryRemoteDataSource.getBanners(welayat, page);
  // }

  @override
  Future<List<VideoCardEntity>> getVideos() async {
    return await galleryRemoteDataSource.getVideos();
  }

  @override
  Future<VideoEntity> getVideo(int id) async {
    return await galleryRemoteDataSource.getVideo(id);
  }

}
