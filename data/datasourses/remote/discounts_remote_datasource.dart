// ignore_for_file: deprecated_member_use

import 'dart:convert';

import '../../models/discount_models/discount_detal_model.dart';
import '/data/models/discount_models/discout_category_model.dart';

import '../../models/discount_models/post_discount_model.dart';
import '/data/models/register/response_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../config/vars/constants.dart';
import '../../models/discount_models/discount_model.dart';

import 'package:http/http.dart' as http;

import 'http_vars.dart';

abstract class DiscountsRemoteDataSource {
  Future<List<DiscountModel>> getDiscounts();
  Future<List<DiscountModel>> categoryPost(int id);
  Future<List<DiscountModel>> subCategoryPost(int id);
  Future<DiscountDetalModel> getDetal(int id);
  Future<ResponseModel> postDiscount(PostDiscountModel obj);
  Future<List<DiscountCategoryModel>> discountCategories();

  // Future<List<DiscountSubcategoryModel>> discountSub(int categoryID);
}

class DiscountsDataSourceImpl implements DiscountsRemoteDataSource {
  final http.Client httpClient;
  DiscountsDataSourceImpl(this.httpClient);
  @override
  Future<List<DiscountModel>> getDiscounts() async {
    final response =
        await httpClient.get(Uris.discounts, headers: Headers.contentJson);
    final res = json.decode(response.body)["data"] as List;
    print("response discount:=$res");
    if (response.statusCode == 200) {
      return DiscountModel.fromJsonList(res);
    } else {
      return [];
    }
    // return HttpsFuncs.responseChecker(
    //   response,
    //   DiscountModel.fromJsonList(json.decode(response.body)),
    // );
    // print("asdasdas BAnner:=${BanerModel.fromJsonList(apiBanner)}");
  }

  @override
  Future<List<DiscountModel>> categoryPost(int id) async {
    final response = await httpClient.get(Uris.categoryPost(id),
        headers: Headers.contentJson);
    final res = json.decode(response.body)["data"] as List;
    print("response categoryPost:=$res");
    if (response.statusCode == 200) {
      return DiscountModel.fromJsonList(res);
    } else {
      return [];
    }
  }

  @override
  Future<List<DiscountModel>> subCategoryPost(int id) async {
    final response = await httpClient.get(Uris.subCategoryPost(id),
        headers: Headers.contentJson);
    final res = json.decode(response.body)["data"] as List;
    print("response subCategoryPost:=$res");
    if (response.statusCode == 200) {
      return DiscountModel.fromJsonList(res);
    } else {
      return [];
    }
  }

  @override
  Future<DiscountDetalModel> getDetal(int id) async {
    final response =
        await httpClient.get(Uris.disDetal(id), headers: Headers.contentJson);
    final res = json.decode(response.body)["discount"];
    print("response discount detal:=$res");
    if (response.statusCode == 200) {
      return DiscountDetalModel.frowJson(res);
    } else {
      return DiscountDetalModel.empty();
    }
    // return HttpsFuncs.responseChecker(
    //   response,
    //   DiscountModel.fromJsonList(json.decode(response.body)),
    // );
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
    for (int i = 0; i < obj.images.length; i++) {
      var multipartFile =
          await http.MultipartFile.fromPath('image', obj.images[i]);
      imgList.add(multipartFile);
    }
    //SingleImage====================================================================================
    // var multipartFile =
    //     await http.MultipartFile.fromPath('image', obj.images[0]);
    // imgList.add(multipartFile);
    //===============================================================================================

    print("request:=${obj.toJson()}");
    var request = http.MultipartRequest('POST', Uris.postDiscount)
      ..headers.addAll(Headers.bearer(token))
      ..fields.addAll(obj.toJson())
      ..files.addAll(imgList);

    var response = await request.send();
    var responseAnswer = await http.Response.fromStream(response);
    print("+*+${responseAnswer.statusCode}");
    print("+*+${responseAnswer.body}");

    return ResponseModel.frowJson(jsonDecode(responseAnswer.body));
  }

  @override
  Future<List<DiscountCategoryModel>> discountCategories() async {
    final categoryResponse = await httpClient.get(Uris.discoutCategories,
        headers: Headers.contentJson);
    if (categoryResponse.statusCode == 200) {
      final categoryRes = json.decode(categoryResponse.body)["data"] as List;
      print("Category response:=$categoryRes");
      return DiscountCategoryModel.fromJsonList(categoryRes);
    } else {
      return [];
    }
  }

  // @override
  // Future<List<DiscountSubcategoryModel>> discountSub(int categoryID) async {
  //   print("categorysub request:$categoryID");
  //   return await http
  //       .post(Uris.discoutSubcategories,
  //           headers: Headers.contentJson,
  //           body: jsonEncode({"category": categoryID}))
  //       .then(
  //     (response) {
  //       final subRes = json.decode(response.body);
  //       print("categorysub response:=$subRes");
  //       if (response.statusCode == 200 && subRes.runtimeType == List) {
  //         return DiscountSubcategoryModel.fromJsonList(
  //             jsonDecode(response.body));
  //       } else {
  //         return [];
  //       }
  //     },
  //   );
  // }
}
