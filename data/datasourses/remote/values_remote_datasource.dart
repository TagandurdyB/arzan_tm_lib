import 'dart:convert';

import '../../models/baner_model.dart';

import 'package:http/http.dart' as http;

import '../../models/value_model.dart';
import 'http_vars.dart';

abstract class ValuesRemoteDataSource {
  Future<List<BanerModel>> getBanners(int welayat, int page, int category);
  Future<List<ValueModel>> getLocations();
  Future<List<ValueModel>> getVideoCategories();
  Future<List<ValueModel>> getImgCategories();
}

class ValuesDataSourceImpl implements ValuesRemoteDataSource {
  final http.Client httpClient;
  ValuesDataSourceImpl(this.httpClient);
  @override
  Future<List<BanerModel>> getBanners(
      int welayat, int page, int category) async {
    print("${Uris.banner(welayat, page, category)}");
    final response = await httpClient.get(Uris.banner(welayat, page, category),
        headers: Headers.contentJson);
    final res = json.decode(response.body)["data"] as List;
    // final resList = res.where((element) => element["type"] == "App").toList();
    if (response.statusCode == 200) {
      return BanerModel.fromJsonList(res);
    } else {
      return [BanerModel.empty];
    }
  }

  @override
  Future<List<ValueModel>> getLocations() async {
    final response =
        await httpClient.get(Uris.locations, headers: Headers.contentJson);
    List res = json.decode(response.body)["data"] as List;
    // final resList = res.where((element) => element["type"] == "App").toList();
    if (response.statusCode == 200) {
      return ValueModel.fromJsonList(res);
    } else {
      return [];
    }
  }

  @override
  Future<List<ValueModel>> getVideoCategories() async {
    final response = await httpClient.get(Uris.videoCategories,
        headers: Headers.contentJson);
    List res = json.decode(response.body)["data"] as List;
    // final resList = res.where((element) => element["type"] == "App").toList();
    if (response.statusCode == 200) {
      return res
          .map((e) => ValueModel(
                id: e["id"],
                name: e["category"]["name"],
                img: "http://${Uris.ip}:${Uris.port}/${e["image"]["url"]}",
              ))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<List<ValueModel>> getImgCategories() async {
    final response = await httpClient.get(Uris.imageCategories,
        headers: Headers.contentJson);
    List res = json.decode(response.body)["data"] as List;
    // final resList = res.where((element) => element["type"] == "App").toList();
    print("Gallery>getImgCategories response:=$res");
    if (response.statusCode == 200) {
      return res
          .map((e) => ValueModel(
                id: e["id"],
                name: e["category"]["name"],
                img: "http://${Uris.ip}:${Uris.port}/${e["image"]["url"]}",
              ))
          .toList();
    } else {
      return [];
    }
  }
}
