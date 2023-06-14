import 'dart:convert';

import '../../models/register/user_http_entity.dart';
import '/data/models/register/check_model.dart';

import '/data/models/register/response_model.dart';

import '/data/models/register/log_in_model.dart';
import '/data/models/register/sign_up_model.dart';

import 'http_vars.dart';

import 'package:http/http.dart' as http;

abstract class RegisterRemoteDataSource {
  Future<ResponseModel> postSignUp(SignUpModel obj);
  Future<UserResponseModel> postLogIn(LogInModel obj);
  Future<ResponseModel> postCheck(CheckModel obj);
  Future<ResponseModel> postRecover(UserRequestModel obj);
  Future<UserResponseModel> postUser(UserRequestModel obj);
}

class RegisterDataSourceImpl implements RegisterRemoteDataSource {
  final http.Client httpClient;
  RegisterDataSourceImpl(this.httpClient);
  @override
  Future<ResponseModel> postSignUp(SignUpModel obj) async {
    return await httpClient
        .post(Uris.register,
            headers: Headers.contentJson, body: jsonEncode(obj.toJson()))
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
  Future<UserResponseModel> postLogIn(LogInModel obj) async {
    return await httpClient
        .post(Uris.login,
            headers: Headers.contentJson, body: jsonEncode(obj.toJson()))
        .then((response) {
      final res = json.decode(response.body);
      print("response:=$res");
      if (response.statusCode == 200) {
        if (res["status"] == null) {
          final String token = json.decode(response.body)["token"];
          print("token:=$token");
          return UserResponseModel.frowJson(json.decode(response.body));
        } else {
          return UserResponseModel.empty;
        }
      } else {
        print("Error in Login!!! statusCode:${response.statusCode}");
        print("Error in Login!!! :$res");
        print("Error in Login!!! :${obj.toJson()}");
        return UserResponseModel.frowJson(json.decode(response.body));
      }
    });
  }

  @override
  Future<ResponseModel> postCheck(CheckModel obj) async {
    return await httpClient
        .post(Uris.checkAcaunt,
            headers: Headers.contentJson, body: jsonEncode(obj.toJson()))
        .then((response) {
      if (response.statusCode == 200) {
        print("*** ${json.decode(response.body)}");
        final String token = json.decode(response.body)["token"];
        print("token:=$token");
        return ResponseModel.frowJson(json.decode(response.body));
      } else {
        print("Error in Check!!! statusCode:${response.statusCode}");
        print("Error in Check!!! :${response.body}");
        print("Error in Check!!! :${obj.toJson()}");
        return ResponseModel.frowJson(json.decode(response.body));
      }
    });
  }

  @override
  Future<ResponseModel> postRecover(UserRequestModel obj) async {
    return await httpClient
        .post(Uris.recover,
            headers: Headers.contentJson, body: jsonEncode(obj.toJson()))
        .then((response) {
      final res = json.decode(response.body);
      if (response.statusCode == 200) {
        // final status = res[""];
        print("***recover $res");
        return ResponseModel.frowJson(res);
      } else {
        print("Error in recover!!! statusCode:${response.statusCode}");
        print("Error in recover!!! :${response.body}");
        print("Error in recover!!! :${obj.toJson()}");
        return ResponseModel.frowJson(res);
      }
    });
  }

  @override
  Future<UserResponseModel> postUser(UserRequestModel obj) async {
    print("request:=${obj.toJson()}");
    return await httpClient
        .post(Uris.checkUser,
            headers: Headers.contentJson, body: jsonEncode(obj.toJson()))
        .then((response) {
      final res = json.decode(response.body);
      print("response:=$res");
      if (response.statusCode == 200) {
        if (res["status"] == "true") {
          return UserResponseModel.frowJson(json.decode(response.body));
        } else {
          return UserResponseModel.empty;
        }
      } else {
        print("Error in Check User!!! statusCode:${response.statusCode}");
        print("Error in Check User!!! :$res");
        print("Error in Check User!!! :${obj.toJson()}");
        return UserResponseModel.frowJson(json.decode(response.body));
      }
    });
  }
}
