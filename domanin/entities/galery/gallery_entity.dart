import 'content_card_entity.dart';

import '../baner_entity.dart';

class GalleryEntity {
  final List<BanerEntity> banners;
  final List<ContentCardEntity> folders;
  final bool isEmpty;
  GalleryEntity({
    required this.banners,
    required this.folders,
    this.isEmpty = true,
  });

}
