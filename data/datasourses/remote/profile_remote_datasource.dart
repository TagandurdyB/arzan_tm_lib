import 'dart:convert';

import '../../models/profile/user_profile_model.dart';
import 'package:http/http.dart' as http;

import 'http_vars.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileModel> accountFetch(int userId);
  Future<List<UserProfileModel>> tops(int limit, int offset);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final http.Client httpClient;
  ProfileRemoteDataSourceImpl(this.httpClient);

  @override
  Future<UserProfileModel> accountFetch(int userId) async {
    print("${Uris.myProfile(userId)}");
    final response = await httpClient.get(Uris.myProfile(userId),
        headers: Headers.contentJson);
    final res = json.decode(response.body)["data"] as Map<String, dynamic>;
    // final resList = res.where((element) => element["type"] == "App").toList();
    if (response.statusCode == 200) {
      print("*** accountFetch := $res");
      return UserProfileModel.frowJson(res);
    } else {
      print("Error in accountFetch!!! statusCode:${response.statusCode}");
      print("Error in accountFetch!!!:${response.body}");
      print("Error in accountFetch!!! :$userId");
      return UserProfileModel.empty();
    }
  }

  @override
  Future<List<UserProfileModel>> tops(int limit, int offset) async {
    print("${Uris.tops(limit, offset)}");
    final response = await httpClient.get(Uris.tops(limit, offset),
        headers: Headers.contentJson);
    final res = json.decode(response.body)["data"] as List;
    // final resList = res.where((element) => element["type"] == "App").toList();
    if (response.statusCode == 200) {
      print("*** tops := $res");
      return UserProfileModel.fromJsonList(res);
    } else {
      print("Error in tops!!! statusCode:${response.statusCode}");
      print("Error in tops!!!:${response.body}");
      print("Error in tops!!! :$limit   $offset");
      return [];
    }
  }
}
