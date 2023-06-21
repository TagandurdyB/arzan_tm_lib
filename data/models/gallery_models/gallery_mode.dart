// ignore_for_file: overridden_fields

import '/domanin/entities/galery/gallery_entity.dart';

import '../baner_model.dart';
import 'content_card_model.dart';

class GalleryModel extends GalleryEntity {
  @override
  final List<BanerModel> banners;
  @override
  final List<ContentCardModel> folders;
  @override
  final bool isEmpty;
  GalleryModel({
    required this.banners,
    required this.folders,
    this.isEmpty = true,
  }) : super(banners: banners, folders: folders);

  static GalleryModel empty() => GalleryModel(
        banners: [],
        folders: [],
      );

  factory GalleryModel.frowJson(Map<String, dynamic> json) => GalleryModel(
        banners: BanerModel.fromJsonList(json["banners"]),
        folders: ContentCardModel.fromJsonList(json["folders"]),
        isEmpty: false,
      );

  Map<String, dynamic> toJson() => {
        "banners": banners,
        "folders": folders,
      };
}
