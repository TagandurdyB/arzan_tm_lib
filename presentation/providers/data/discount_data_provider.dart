import 'package:arzan/domanin/entities/discounts/discount_category_entity.dart';

import '/domanin/entities/discounts/discount_detal_entity.dart';

import '/domanin/entities/discounts/post_discount_entity.dart';

import '../../../domanin/entities/register/response_entity.dart';
import '/domanin/usecases/discounts_case.dart';

import '../../../domanin/entities/discounts/discount_entity.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class DiscountDataP extends ChangeNotifier {
  final DiscountsCase discountsCase;
  DiscountDataP({required this.discountsCase});

  // MainPageEntity entity = MainPageEntity.empty;
  // MainPageEntity entity = MainPageEntity.frowJson(api);

  // Future<void> fillEntity() async {
  //   // try {
  //   //   entity = await mainPageCase.get();
  //   //   notifyListeners();
  //   // } catch (err) {
  //   //   throw ("Error MainPageP: $err");
  //   // }
  // }

  // List<DiscountEntity> discounts = DiscountEntity.fromJsonList(
  //   [
  //     {
  //       "id": 1,
  //       "mod": 23,
  //       "img":
  //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCJgQkIzfThEOELfWHJbRXvDPbuAEIRo8Dog&usqp=CAU",
  //       "title": "Mebel zakaz1",
  //       "created_at": DateTime.now(),
  //       "viewed": 0,
  //     },
  //     {
  //       "id": 2,
  //       "mod": 23,
  //       "img":
  //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCJgQkIzfThEOELfWHJbRXvDPbuAEIRo8Dog&usqp=CAU",
  //       "title": "Mebel zakaz2 ",
  //       "created_at": DateTime.now(),
  //       "viewed": 0,
  //     },
  //   ],
  // );

  int _discoutIndex = 0;
  int get discoutIndex => _discoutIndex;
  void changeDiscountIndex(int index) {
    _discoutIndex = index;
    notifyListeners();
  }

  int get discoutID => discounts[_discoutIndex].id;

  DiscountEntity get discout => discounts[_discoutIndex];

  void get pervious {
    if (_discoutIndex > 0) {
      _discoutIndex--;
    }
    notifyListeners();
  }

  void get next {
    if (_discoutIndex < discounts.length - 1) {
      _discoutIndex++;
    }
    notifyListeners();
  }

  void nextFavorite(int favoriteLength) {
    if (_discoutIndex < favoriteLength - 1) {
      _discoutIndex++;
    }
    notifyListeners();
  }

  List<DiscountEntity> discounts = [];

  int limit = 12;

  Future<void> fillDiscounts(int categoryId, int subID) async {
    try {
      isLast = false;
      discounts = [];
      notifyListeners();
      discounts = await discountsCase.get(12, 0, categoryId, subID);
      notifyListeners();
    } catch (err) {
      throw ("Error DiscountDataP: $err");
    }
  }

  bool isLast = false;
  Future fatchPosts(int offset, int categoryId, int subId) async {
    try {
      final List<DiscountEntity> objs =
          await discountsCase.get(limit, offset, categoryId, subId);
      if (objs.length < limit) isLast = true;
      discounts.addAll(objs);
      // fillSubs();
      notifyListeners();
    } catch (err) {
      throw ("Error VideoDataP>fatchVideos(): $err");
    }
  }

  List<DiscountEntity>? search;
  Future<void> fillSearch(String text) async {
    try {
      // search = null;
      discounts = [];
      notifyListeners();
      discounts = await discountsCase.searchPost(text);
      notifyListeners();
    } catch (err) {
      throw ("Error DiscountDataP>fillSearch($text): $err");
    }
  }

  Future<void> fillPostsSelf(int userId) async {
    try {
      // search = null;
      discounts = [];
      notifyListeners();
      discounts = await discountsCase.selfPost(userId);
      notifyListeners();
    } catch (err) {
      throw ("Error DiscountDataP>fillPostsSelf($userId): $err");
    }
  }

    Future<List<DiscountEntity>> getPostsSelf(int userId) async {
    try {
      // search = null;
      return  await discountsCase.selfPost(userId);
      // notifyListeners();
    } catch (err) {
      throw ("Error DiscountDataP>getPostsSelf($userId): $err");
    }
  }

//Detal==========================================================================
  DiscountDetalEntity detal = DiscountDetalEntity.empty();
  Future<void> fillDetal(int id) async {
    try {
      detal = await discountsCase.detal(id);
      notifyListeners();
    } catch (err) {
      throw ("Error DiscountDataP: $err");
    }
  }

  Future<DiscountDetalEntity> fetchDetal(int id) async {
    try {
      return await discountsCase.detal(id);
    } catch (err) {
      throw ("Error DiscountDataP: $err");
    }
  }

//Detal==========================================================================
//Sort==========================================================================
  Future<List<DiscountEntity>> fetchCategoryD(int categoryId) async {
    try {
      return await discountsCase.get(limit, 0, categoryId, 0);
      // return await discountsCase.categoryPost(categoryId);
    } catch (err) {
      throw ("Error DiscountDataP>fetchCategoryD: $err");
    }
  }

  Future<List<DiscountEntity>> fetchSubCategory(int subId) async {
    try {
      return await discountsCase.get(limit, 0, 0, subId);
      // return await discountsCase.subCategoryPost(subId);
    } catch (err) {
      throw ("Error DiscountDataP>fetchSubCategory: $err");
    }
  }

//Sort==========================================================================

//Categories==========================================================================
  // MainPageEntity entity = MainPageEntity.empty;
  // MainPageEntity entity = MainPageEntity.frowJson(api);

  List _categories = [];
  List<DiscountCategoryEntity> get categories =>
      _categories.cast<DiscountCategoryEntity>();
  void fillCategories() async {
    try {
      _categories = await discountsCase.categories();
      // fillSubs();
      notifyListeners();
    } catch (err) {
      throw ("Error DiscountDataP>fillCategories(): $err");
    }
  }

  // void fillSubs() async {
  //   try {
  //     _categories = _categories
  //         .map((category) async =>
  //             category.forSubList(await discountsCase.subs(category.id)))
  //         .toList();
  //     notifyListeners();
  //   } catch (err) {
  //     throw ("Error DiscountDataP>fillCategories>fillSubs(): $err");
  //   }
  // }
//!Categories=========================================================================

  Future<ResponseEntity> addPost(PostDiscountEntity obj) async {
    final ResponseEntity entity = await discountsCase.postDiscount(obj);
    print("entity :=${entity.result} , ${entity.status}");
    return entity;
  }

  int _badge = 0;
  int get badge => _badge;

  Future<void> fillBadge() async {
    try {
      _badge = await discountsCase.badgePost();
      notifyListeners();
      // return _badge;
    } catch (err) {
      throw ("Error DiscountDataP>fillBadge: $err");
    }
  }

  static DiscountDataP of(BuildContext context, {bool listen = true}) =>
      Provider.of<DiscountDataP>(context, listen: listen);
}
