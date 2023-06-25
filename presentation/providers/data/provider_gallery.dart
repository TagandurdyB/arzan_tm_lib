import 'package:arzan/domanin/entities/galery/content_card_entity.dart';
import 'package:arzan/domanin/entities/galery/img_entity.dart';

import '../../../domanin/usecases/gallery_case.dart';

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class GalleryP extends ChangeNotifier {
  final GalleryCase galleryCase;
  GalleryP({required this.galleryCase});

//=================================================================================
  List<ContentCardEntity>? folders = [];
  List<ImgEntity> images = [];

  Future<void> fillImgFolders(int categoryID) async {
    try {
      folders = null;
      folders = await galleryCase.getImgFolders(categoryID);
      // return folders;
      // fillSubs();
      notifyListeners();
    } catch (err) {
      throw ("Error GalleryP>fillImgFolders(): $err");
    }
  }

  Future<void> fillImgs(int folderID) async {
    try {
      images = await galleryCase.getImages(folderID);
      // return folders;
      // fillSubs();
      notifyListeners();
    } catch (err) {
      throw ("Error GalleryP>fillImgs(): $err");
    }
  }

  int _selectImgCategoryIndex = 0;
  int get selectImgCategoryIndex => _selectImgCategoryIndex;
  void chageSelectedImgCategoryIndex(int index) {
    _selectImgCategoryIndex = index;
    notifyListeners();
  }
//=================================================================================

  static GalleryP of(BuildContext context, {bool listen = true}) =>
      Provider.of<GalleryP>(context, listen: listen);
}
