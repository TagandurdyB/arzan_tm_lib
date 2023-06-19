import 'dart:convert';

import '../../models/baner_model.dart';

import 'package:http/http.dart' as http;

import '../../models/location_model.dart';
import 'http_vars.dart';

abstract class ValuesRemoteDataSource {
  Future<List<BanerModel>> getBanners(int welayat, int page);
  Future<List<LocationModel>> getLocations();
}

class ValuesDataSourceImpl implements ValuesRemoteDataSource {
  final http.Client httpClient;
  ValuesDataSourceImpl(this.httpClient);
  @override
  Future<List<BanerModel>> getBanners(int welayat, int page) async {
    final response = await httpClient.get(Uris.banner(welayat, page),
        headers: Headers.contentJson);
    final res = json.decode(response.body)["data"] as List;
    // final resList = res.where((element) => element["type"] == "App").toList();
    if (response.statusCode == 200) {
      return BanerModel.fromJsonList(res);
    } else {
      return [];
    }
  }

  @override
  Future<List<LocationModel>> getLocations() async {
    final response =
        await httpClient.get(Uris.locations, headers: Headers.contentJson);
    List res = json.decode(response.body)["data"] as List;
    // final resList = res.where((element) => element["type"] == "App").toList();
    if (response.statusCode == 200) {
      return LocationModel.fromJsonList(res);
    } else {
      return [];
    }
  }
}
