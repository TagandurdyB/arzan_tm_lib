import 'dart:convert';

import 'api_main_page.dart';
import 'http_vars.dart';

import '/data/models/main_page_models/main_page_model.dart';
import 'package:http/http.dart' as http;

import 'https_funcs.dart';

abstract class MainPageRemoteDataSource {
  Future<MainPageModel> getMainPage();
}

class MainPageDataSourceImpl implements MainPageRemoteDataSource {
  final http.Client httpClient;
  MainPageDataSourceImpl(this.httpClient);
  @override
  Future<MainPageModel> getMainPage() async {
    final response =
        await httpClient.get(Uris.mainPage, headers: Headers.mainPage);
    return HttpsFuncs.responseChecker(
      response,
      // MainPageModel.frowJson(api),
      MainPageModel.frowJson(json.decode(response.body)),
    );
  }
}
