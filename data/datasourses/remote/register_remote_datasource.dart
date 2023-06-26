import 'dart:convert';

import '../../models/register/user_http_entity.dart';
import '/data/models/register/check_model.dart';

import '/data/models/register/response_model.dart';

import '/data/models/register/log_in_model.dart';
import '/data/models/register/sign_up_model.dart';

import 'http_vars.dart';

import 'package:http/http.dart' as http;

abstract class RegisterRemoteDataSource {
  //SignUP====================================
  Future<ResponseModel> postSignUp(SignUpModel obj);
  Future<ResponseModel> postCheck(CheckModel obj);
  //Login=====================================
  Future<ResponseModel> postLogIn(LogInModel obj);
  Future<UserResponseModel> postUser(UserRequestModel obj);
  //Recover===================================
  Future<ResponseModel> postExist(UserRequestModel obj);
  Future<ResponseModel> postCheckRecover(CheckModel obj);
  Future<ResponseModel> postRecover(UserRequestModel obj);
}

class RegisterDataSourceImpl implements RegisterRemoteDataSource {
  final http.Client httpClient;
  RegisterDataSourceImpl(this.httpClient);
  @override
  Future<ResponseModel> postSignUp(SignUpModel obj) async {
    print("URL://${Uris.register}");
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
  Future<ResponseModel> postLogIn(LogInModel obj) async {
    print("response login:=${obj.toJson()}");
    return await httpClient
        .post(Uris.login,
            headers: Headers.contentJson, body: jsonEncode(obj.toJson()))
        .then((response) {
      final res = json.decode(response.body);
      print("response login:=$res");
      if (response.statusCode == 200) {
        if (res["status"]) {
          final String token = res["data"]["token"];
          print("token:=$token");
          return ResponseModel.frowJson(res);
        } else {
          return ResponseModel.empty;
        }
      } else {
        print("Error in Login!!! statusCode:${response.statusCode}");
        print("Error in Login!!! :$res");
        print("Error in Login!!! :${obj.toJson()}");
        return ResponseModel.frowJson(res);
      }
    });
  }

  @override
  Future<ResponseModel> postCheck(CheckModel obj) async {
    print("request postCheck+ + + :=+${obj.phone}");
    return await httpClient
        .post(Uris.checkAcaunt,
            headers: Headers.contentJson, body: jsonEncode(obj.toJson()))
        .then((response) {
      final res = json.decode(response.body);
      print("response postCheck:=$res");
      if (response.statusCode == 200) {
        print("*** $res");
        return ResponseModel.frowJson(res);
      } else {
        print("Error in Check!!! statusCode:${response.statusCode}");
        print("Error in Check!!! :${response.body}");
        print("Error in Check!!! :${obj.toJson()}");
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

  //Recover=======================================================================================
  @override
  Future<ResponseModel> postExist(UserRequestModel obj) async {
    print("request postExist+ + + :=+${obj.toJson()}");
    return await httpClient
        .post(Uris.exist,
            headers: Headers.contentJson, body: jsonEncode(obj.toJson()))
        .then((response) {
      final res = json.decode(response.body);
      if (response.statusCode == 200) {
        // final status = res[""];
        print("***postExist $res");
        return ResponseModel.frowJson(res);
      } else {
        print("Error in postExist!!! statusCode:${response.statusCode}");
        print("Error in postExist!!! :${response.body}");
        print("Error in postExist!!! :${obj.toJson()}");
        return ResponseModel.frowJson(res);
      }
    });
  }

  @override
  Future<ResponseModel> postCheckRecover(CheckModel obj) async {
    print("request postCheckRecover+ + + :=+${obj.phone}");
    return await httpClient
        .post(Uris.chackRecover,
            headers: Headers.contentJson, body: jsonEncode(obj.toJson()))
        .then((response) {
      final res = json.decode(response.body);
      print("response postCheckRecover:=$res");
      if (response.statusCode == 200) {
        print("*** $res");
        return ResponseModel.frowJson(res);
      } else {
        print("Error in postCheckRecover!!! statusCode:${response.statusCode}");
        print("Error in postCheckRecover!!! :${response.body}");
        print("Error in postCheckRecover!!! :${obj.toJson()}");
        return ResponseModel.frowJson(res);
      }
    });
  }

  @override
  Future<ResponseModel> postRecover(UserRequestModel obj) async {
    print("request postRecover+ + + :=+${obj.toJson()}");
    return await httpClient
        .post(Uris.recover,
            headers: Headers.contentJson, body: jsonEncode(obj.toJson()))
        .then((response) {
      final res = json.decode(response.body);
      if (response.statusCode == 200) {
        // final status = res[""];
        print("***recover $res");
        // arzan.tm/photo
        // arzan.tm/video
        return ResponseModel.frowJson(res);
      } else {
        print("Error in recover!!! statusCode:${response.statusCode}");
        print("Error in recover!!! :${response.body}");
        print("Error in recover!!! :${obj.toJson()}");
        return ResponseModel.frowJson(res);
      }
    });
  }
}
