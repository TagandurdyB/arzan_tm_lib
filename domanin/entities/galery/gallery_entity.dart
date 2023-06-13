import '/domanin/entities/galery/big_content_card_entity.dart';

import '../baner_entity.dart';

class GalleryEntity {
  final List<BanerEntity> banners;
  final List<BigCardEntity> folders;
  final bool isEmpty;
  GalleryEntity({
    required this.banners,
    required this.folders,
    this.isEmpty = true,
  });

}
