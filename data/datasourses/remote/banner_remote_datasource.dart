import 'dart:convert';

import '../../models/baner_model.dart';

import 'package:http/http.dart' as http;

import 'http_vars.dart';

abstract class BannerRemoteDataSource {
  Future<List<BanerModel>> getBanners(String welayat, String page);
}

class BannerDataSourceImpl implements BannerRemoteDataSource {
  final http.Client httpClient;
  BannerDataSourceImpl(this.httpClient);
  @override
  Future<List<BanerModel>> getBanners(String welayat, String page) async {
    final response = await httpClient.get(Uris.banner(welayat, page),
        headers: Headers.contentJson);
    final res = json.decode(response.body);
    if (response.statusCode == 200) {
      return BanerModel.fromJsonList(res);
    } else {
      return [];
    }
    // return HttpsFuncs.responseChecker(
    //   response,
    //   BanerModel.frowJson(json.decode(response.body)),
    // );
    // return await Future.delayed(const Duration(seconds: 1))
    //     .then((value) => BanerModel.fromJsonList(apiBanner));
  }
}
