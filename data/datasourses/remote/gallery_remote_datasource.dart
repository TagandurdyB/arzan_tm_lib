import 'dart:convert';

import 'package:arzan/data/models/gallery_models/img_model.dart';
import 'package:arzan/data/models/register/response_model.dart';
import 'package:arzan/data/models/user_model.dart';
import 'package:arzan/domanin/entities/register/response_entity.dart';
import 'package:hive/hive.dart';

import '../../../config/vars/constants.dart';
import '../../models/gallery_models/content_card_model.dart';
import '/data/models/gallery_models/video_model.dart';
import 'package:http/http.dart' as http;

import 'http_vars.dart';

abstract class GalleryRemoteDataSource {
  Future<List<ContentCardModel>> getImgFolders(int id);
  Future<List<ImgModel>> getImgs(int id);
  Future<List<ContentCardModel>> getVideos(int id);
  Future<VideoModel> getVideo(int id);
  Future<ResponseModel> likePost(int id);
}

class GalleryDataSourceImpl implements GalleryRemoteDataSource {
  final http.Client httpClient;
  GalleryDataSourceImpl(this.httpClient);

  @override
  Future<List<ContentCardModel>> getImgFolders(int id) async {
    print("URL://${Uris.imgFolders(id)}");
    final response =
        await httpClient.get(Uris.imgFolders(id), headers: Headers.contentJson);
    final res = json.decode(response.body)["data"];
    if (response.statusCode == 200) {
      print("GalleryDataSourceImpl getImgFolders*** $res");
      return ContentCardModel.fromJsonListI(res);
    } else {
      print("Error in getImgFolders!!! statusCode:${response.statusCode}");
      print("Error in getImgFolders!!!:${response.body}");
      print("Error in getImgFolders!!! :$res");
      return [];
    }
  }

  @override
  Future<List<ImgModel>> getImgs(int id) async {
    print("URL://${Uris.images(id)}");
    final response =
        await httpClient.get(Uris.images(id), headers: Headers.contentJson);
    final res = json.decode(response.body)["data"]["images"];
    if (response.statusCode == 200) {
      print("GalleryDataSourceImpl getImgs*** $res");
      return ImgModel.fromJsonList(res);
    } else {
      print("Error in getImgs!!! statusCode:${response.statusCode}");
      print("Error in getImgs!!!:${response.body}");
      print("Error in getImgs!!! :$res");
      return [];
    }
  }

  @override
  Future<List<ContentCardModel>> getVideos(int id) async {
    final myBase = Hive.box(Tags.hiveBase);
    final String? token = myBase.get(Tags.hiveToken);
    print("URL://${Uris.videoCards(id)}");
    final response = await httpClient.get(Uris.videoCards(id),
        headers: token != null ? Headers.bearer(token) : Headers.contentJson);
    final res = json.decode(response.body)["data"];
    if (response.statusCode == 200) {
      print("GalleryDataSourceImpl getVideos*** $res");
      return ContentCardModel.fromJsonListV(res);
    } else {
      print("Error in getVideos!!! statusCode:${response.statusCode}");
      print("Error in getVideos!!!:${response.body}");
      print("Error in getVideos!!! :$res");
      return [];
    }
  }

  @override
  Future<VideoModel> getVideo(int id) async {
    print("URL://${Uris.video(id)}");
    // final response =
    //     await httpClient.get(Uris.video(id), headers: Headers.contentJson);
    // final res = json.decode(response.body);
    // if (response.statusCode == 200) {
    //   print("GalleryDataSourceImpl getVideo*** $res");
    //   return VideoModel.frowJson(res);
    // } else {
    //   print("Error in getVideo!!! statusCode:${response.statusCode}");
    //   print("Error in getVideo!!!:${response.body}");
    //   print("Error in getVideo!!! :$res");
    //   return VideoModel.frowJson(res);
    // }

    return Future.delayed(const Duration(seconds: 3)).then((value) => VideoModel(
        title: "Loremssdada sdas fsadf asdf sadf d",
        videoUrl:
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
        likeCount: 1243,
        user: UserModel(
            avatarImg: "", id: 1, name: "100Haryt", role: Role.Official)));
  }

  @override
  Future<ResponseModel> likePost(int id) async {
    final myBase = Hive.box(Tags.hiveBase);
    final String? token = myBase.get(Tags.hiveToken);
    print("URL://${Uris.likePost}");
    if (token != null) {
      // final response =
      //     await httpClient.get(Uris.likePost, headers: Headers.bearer(token));
      // final res = json.decode(response.body);
      // if (response.statusCode == 200) {
      //   print("GalleryDataSourceImpl LikePost*** $res");
      //   return ResponseModel.frowJson(res);
      // } else {
      //   print("Error in LikePost!!! statusCode:${response.statusCode}");
      //   print("Error in LikePost!!!:${response.body}");
      //   print("Error in LikePost!!! :$res");
      //   return ResponseModel.frowJson(res);
      // }

      return await httpClient
          .post(Uris.checkAcaunt,
              headers:
                  token != null ? Headers.bearer(token) : Headers.contentJson,
              body: jsonEncode({"id": id}))
          .then((response) {
        final res = json.decode(response.body);
        print("response likePost:=$res");
        if (response.statusCode == 200) {
          print("*** $res");
          return ResponseModel.frowJson(res);
        } else {
          print("Error in likePost!!! statusCode:${response.statusCode}");
          print("Error in likePost!!! :${response.body}");
          print("Error in likePost!!! :${id}");
          return ResponseModel.frowJson(res);
        }
      });
    } else {
      return ResponseModel(result: "I need Token", status: false);
    }
  }
}
