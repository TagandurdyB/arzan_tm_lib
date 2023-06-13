import '/domanin/entities/galery/big_content_card_entity.dart';
import '../../../domanin/entities/baner_entity.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../../../domanin/entities/galery/gallery_entity.dart';
import '../../../domanin/entities/galery/img_card_entity.dart';

class GalleryP extends ChangeNotifier {
  // final MainPageCase galleryCase;
  // GalleryP({required this.mainPageCase});

  // // MainPageEntity entity = MainPageEntity.empty;
  // MainPageEntity entity = MainPageEntity.frowJson(api);

  // Future<void> fillEntity() async {
  //   // try {
  //   //   entity = await mainPageCase.get();
  //   //   notifyListeners();
  //   // } catch (err) {
  //   //   throw ("Error MainPageP: $err");
  //   // }
  // }

  List<ImgCardEntity> imgEntity = [
    ImgCardEntity(
      id: 1,
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSafaDKQ9bXl8GzQUza0ye7V0bsKAjnfmGgtw&usqp=CAU",
      isEmpty: false,
      liked: 150,
      viewed: 1251,
    ),
    ImgCardEntity(
      id: 1,
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSafaDKQ9bXl8GzQUza0ye7V0bsKAjnfmGgtw&usqp=CAU",
      isEmpty: false,
      liked: 150,
      viewed: 1251,
    ),
    ImgCardEntity(
      id: 1,
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSafaDKQ9bXl8GzQUza0ye7V0bsKAjnfmGgtw&usqp=CAU",
      isEmpty: false,
      liked: 150,
      viewed: 1251,
    ),
    ImgCardEntity(
      id: 1,
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSafaDKQ9bXl8GzQUza0ye7V0bsKAjnfmGgtw&usqp=CAU",
      isEmpty: false,
      liked: 150,
      viewed: 1251,
    ),
  ];

  GalleryEntity imgGallery = GalleryEntity(
    banners: [
      BanerEntity(
          id: 3,
          img:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU"),
      BanerEntity(
          id: 2,
          img:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU"),
      BanerEntity(
          id: 3,
          img:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU"),
    ],
    folders: [
      BigCardEntity(
        id: 1,
        userImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnTjWfJm21yqNcNxD_yQO3fI08q2OKIVN54g&usqp=CAU",
        userName: "100haryt.com",
        banerImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
        allCount: 12,
        allShaered: 720,
        allViewed: 14756,
        name:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
        isEmpty: false,
      ),
      BigCardEntity(
        id: 1,
        userImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
        userName: "Mercedes-Benz",
        banerImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
        allCount: 12,
        allShaered: 720,
        allViewed: 14756,
        name:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
        isEmpty: false,
      ),
      BigCardEntity(
        id: 1,
        userImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnTjWfJm21yqNcNxD_yQO3fI08q2OKIVN54g&usqp=CAU",
        userName: "100haryt.com",
        banerImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
        allCount: 12,
        allShaered: 720,
        allViewed: 14756,
        name:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
        isEmpty: false,
      ),
      BigCardEntity(
        id: 1,
        userImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
        userName: "Mercedes-Benz",
        banerImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
        allCount: 12,
        allShaered: 720,
        allViewed: 14756,
        name:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
        isEmpty: false,
      ),
    ],
    isEmpty: false,
  );

  Future<void> fillImgFolders() async {
    try {
      // imgEntity = await galleryCase.get();
      notifyListeners();
    } catch (err) {
      throw ("Error GalleryP fillImgFolders: $err");
    }
  }

  Future<void> fillImagesEntity() async {
    try {
      // imgEntity = await galleryCase.get();
      notifyListeners();
    } catch (err) {
      throw ("Error GalleryP fillImagesEntity: $err");
    }
  }

  static GalleryP of(BuildContext context, {bool listen = true}) =>
      Provider.of<GalleryP>(context, listen: listen);
}
