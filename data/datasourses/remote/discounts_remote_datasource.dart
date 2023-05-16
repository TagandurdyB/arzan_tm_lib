// ignore_for_file: deprecated_member_use

import 'dart:convert';

import '/data/models/post_discount_model.dart';
import '/data/models/register/response_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../config/vars/constants.dart';
import '/data/models/main_page_models/discount_model.dart';

import 'package:http/http.dart' as http;

import 'http_vars.dart';
import 'https_funcs.dart';

abstract class DiscountsRemoteDataSource {
  Future<List<DiscountModel>> getDiscounts();
  Future<ResponseModel> postDiscount(PostDiscountModel obj);
}

class DiscountsDataSourceImpl implements DiscountsRemoteDataSource {
  final http.Client httpClient;
  DiscountsDataSourceImpl(this.httpClient);
  @override
  Future<List<DiscountModel>> getDiscounts() async {
    final response =
        await httpClient.get(Uris.discounts, headers: Headers.mainPage);
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

    var request = http.MultipartRequest('POST', Uris.postDiscount);
    request.headers.addAll(Headers.addPost(token));
    obj.toJson().forEach((key, value) {
      request.fields[key] = value;
    });

    List<http.MultipartFile> imgList = [];

    // for (int i = 0; i < obj.images.length; i++) {
    //   var multipartFile =  await http.MultipartFile.fromPath('image[]', obj.images[i].path);
    //   imgList.add(multipartFile);
    // }

    var multipartFile =
        await http.MultipartFile.fromPath('image', obj.images[0]);
    imgList.add(multipartFile);

    request.files.addAll(imgList);

    var response = await request.send();
    print("+*+${response.statusCode}");

    return ResponseModel.empty;
  }
}
