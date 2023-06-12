// ignore_for_file: deprecated_member_use

import 'dart:convert';

import '/data/models/discount_models/discout_category_model.dart';

import '../../models/discount_models/post_discount_model.dart';
import '/data/models/register/response_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../config/vars/constants.dart';
import '../../models/discount_models/discount_model.dart';

import 'package:http/http.dart' as http;

import 'http_vars.dart';
import 'https_funcs.dart';

abstract class DiscountsRemoteDataSource {
  Future<List<DiscountModel>> getDiscounts();
  Future<ResponseModel> postDiscount(PostDiscountModel obj);
  Future<List<DiscountCategoryModel>> discountCategories();
}

class DiscountsDataSourceImpl implements DiscountsRemoteDataSource {
  final http.Client httpClient;
  DiscountsDataSourceImpl(this.httpClient);
  @override
  Future<List<DiscountModel>> getDiscounts() async {
    final response =
        await httpClient.get(Uris.discounts, headers: Headers.contentJson);
    return HttpsFuncs.responseChecker(
      response,
      DiscountModel.fromJsonList(json.decode(response.body)),
    );
    // print("asdasdas BAnner:=${BanerModel.fromJsonList(apiBanner)}");
  }

  @override
  Future<ResponseModel> postDiscount(PostDiscountModel obj) async {
    final myBase = Hive.box(Tags.hiveBase);
    final String token = myBase.get(Tags.hiveToken);
    print("+*+$token");

    print("+*+${obj.toJson()}");
    Map<String, String> element = {
      "discountElement": json.encode(obj.toJson()).toString()
    };

    List<http.MultipartFile> imgList = [];
    //MultiImage=====================================================================================
    // for (int i = 0; i < obj.images.length; i++) {
    //   var multipartFile =  await http.MultipartFile.fromPath('image[]', obj.images[i].path);
    //   imgList.add(multipartFile);
    // }
    //SingleImage====================================================================================
    var multipartFile =
        await http.MultipartFile.fromPath('image', obj.images[0]);
    imgList.add(multipartFile);
    //===============================================================================================

    var request = http.MultipartRequest('POST', Uris.postDiscount)
      ..headers.addAll(Headers.addPost(token))
      ..fields.addAll(element)
      ..files.add(imgList[0]);

    var response = await request.send();
    var responseAnswer = await http.Response.fromStream(response);
    print("+*+${responseAnswer.statusCode}");
    print("+*+${responseAnswer.body}");

    return ResponseModel.empty;
  }

  @override
  Future<List<DiscountCategoryModel>> discountCategories() async {
    final categoryResponse = await httpClient.get(Uris.discoutCategories,
        headers: Headers.contentJson);
    if (categoryResponse.statusCode == 200) {
      final categoryRes = json.decode(categoryResponse.body) as List;
      print("Category response:=$categoryRes");
      List subs = categoryRes
          .map((catrgory) async => await http
                  .post(Uris.discoutSubcategories,
                      headers: Headers.contentJson,
                      body: jsonEncode({"category": catrgory["id"]}))
                  .then(
                (response) {
                  if (response.statusCode == 200) {
                    return DiscountSubcategoryModel.fromJsonList(
                        jsonDecode(response.body));
                  } else {
                    return [DiscountSubcategoryModel.empty];
                  }
                },
              ))
          .toList();
      return DiscountCategoryModel.fromJsonList(categoryRes, subs);
    } else {
      return [DiscountCategoryModel.empty];
    }
  }
}

// Future<ResponseModel> postCheck(CheckModel obj) async {
//   return await httpClient
//       .post(Uris.checkAcaunt,
//           headers: Headers.contentJson, body: jsonEncode(obj.toJson()))
//       .then((response) {
//     if (response.statusCode == 200) {
//       print("*** ${json.decode(response.body)}");
//       final String token = json.decode(response.body)["token"];
//       print("token:=$token");
//       return ResponseModel.frowJson(json.decode(response.body));
//     } else {
//       print("Error in Check!!! statusCode:${response.statusCode}");
//       print("Error in Check!!! :${response.body}");
//       print("Error in Check!!! :${obj.toJson()}");
//       return ResponseModel.frowJson(json.decode(response.body));
//     }
//   });
// }
