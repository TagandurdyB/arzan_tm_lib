import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../config/vars/constants.dart';
import '/data/models/register/response_model.dart';

import '/data/models/register/log_in_model.dart';
import '/data/models/register/sign_up_model.dart';

import 'http_vars.dart';

import 'package:http/http.dart' as http;

abstract class RegisterRemoteDataSource {
  Future<ResponseModel> postSignUp(SignUpModel obj);
  Future<ResponseModel> postLogIn(LogInModel obj);
}

class RegisterDataSourceImpl implements RegisterRemoteDataSource {
  final http.Client httpClient;
  RegisterDataSourceImpl(this.httpClient);
  @override
  Future<ResponseModel> postSignUp(SignUpModel obj) async {
    return await httpClient
        .post(Uris.register, body: obj.toJson())
        .then((response) {
      if (response.statusCode == 200) {
        print("*** ${json.decode(response.body)}");
        print("*** ${obj.toJson()}");
        return ResponseModel.frowJson(json.decode(response.body));
      } else {
        print("Error in postSignUp!!! statusCode:${response.statusCode}");
        print("Error in postSignUp!!!:${response.body}");
        print("Error in postSignUp!!! :${obj.toJson()}");
        return ResponseModel.frowJson(json.decode(response.body));
      }
    });
  }

  @override
  Future<ResponseModel> postLogIn(LogInModel obj) async {
    return await httpClient
        .post(Uris.login, body: obj.toJson())
        .then((response) {
      if (response.statusCode == 200) {
        print("*** ${json.decode(response.body)}");
        final String token = json.decode(response.body)["token"];
        print("token:=$token");

        return ResponseModel.frowJson(json.decode(response.body));
      } else {
        print("Error in Login!!! statusCode:${response.statusCode}");
        print("Error in Login!!! :${response.body}");
        print("Error in Login!!! :${obj.toJson()}");
        return ResponseModel.frowJson(json.decode(response.body));
      }
    });
  }
}
