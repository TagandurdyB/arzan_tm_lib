import 'api_banner.dart';

import '../../models/main_page_models/baner_model.dart';

import 'package:http/http.dart' as http;

abstract class BannerRemoteDataSource {
  Future<List<BanerModel>> getBanners(String welayat, String page);
}

class BannerDataSourceImpl implements BannerRemoteDataSource {
  final http.Client httpClient;
  BannerDataSourceImpl(this.httpClient);
  @override
  Future<List<BanerModel>> getBanners(String welayat, String page) async {
    // final response = await httpClient.get(Uris.banner(welayat, page),
    //     headers: Headers.mainPage);
    // return HttpsFuncs.responseChecker(
    //   response,
    //   // BanerModel.frowJson(json.decode(response.body)),
    // );
    // print("asdasdas BAnner:=${BanerModel.fromJsonList(apiBanner)}");
    return await Future.delayed(const Duration(seconds: 1))
        .then((value) => BanerModel.fromJsonList(apiBanner));
  }
}
