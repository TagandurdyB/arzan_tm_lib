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

  List<DiscountEntity> discounts = DiscountEntity.fromJsonList(
    [
      {
        "id": 1,
        "mod": 23,
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCJgQkIzfThEOELfWHJbRXvDPbuAEIRo8Dog&usqp=CAU",
        "title": "Mebel zakaz1",
        "created_at": DateTime.now(),
        "viewed": 0,
      },
      {
        "id": 2,
        "mod": 23,
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCJgQkIzfThEOELfWHJbRXvDPbuAEIRo8Dog&usqp=CAU",
        "title": "Mebel zakaz2 ",
        "created_at": DateTime.now(),
        "viewed": 0,
      },
    ],
  );

  Future<void> fillDiscounts() async {
    try {
      discounts = await discountsCase.get();
      notifyListeners();
    } catch (err) {
      throw ("Error DiscountDataP: $err");
    }
  }

  Future<ResponseEntity> addPost(PostDiscountEntity obj) async {
    final ResponseEntity entity = await discountsCase.postDiscount(obj);
    return entity;
  }

  static DiscountDataP of(BuildContext context, {bool listen = true}) =>
      Provider.of<DiscountDataP>(context, listen: listen);
}
