import 'dart:convert';

import '/data/models/gallery_models/img_model.dart';
import '/data/models/register/response_model.dart';
import '/data/models/user_model.dart';
import '/domanin/entities/register/response_entity.dart';
import 'package:hive/hive.dart';

import '../../../config/vars/constants.dart';
import '../../models/gallery_models/content_card_model.dart';
import '/data/models/gallery_models/video_model.dart';
import 'package:http/http.dart' as http;

import 'http_vars.dart';

abstract class GalleryRemoteDataSource {
  Future<List<ContentCardModel>> getImgFolders(int id);
  Future<List<ImgModel>> getImgs(int id);
  Future<List<ContentCardModel>> getVideos(int id, int limit, int offset);
  Future<VideoModel> getVideo(int id);
  Future<ResponseModel> likeVideo(int id);
  Future<ResponseModel> likeImage(int id);
  Future<ResponseModel> viewVideo(int id);
  Future<ResponseModel> viewImage(int id);
  Future<int> badgeVideo();
  Future<int> badgeImgs();
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
  Future<List<ContentCardModel>> getVideos(
      int id, int limit, int offset) async {
    final myBase = Hive.box(Tags.hiveBase);
    final String? token = myBase.get(Tags.hiveToken);
    print("URL://${Uris.videoCards(id, limit, offset)}");
    final response = await httpClient.get(Uris.videoCards(id, limit, offset),
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
  Future<ResponseModel> likeVideo(int id) async {
    final myBase = Hive.box(Tags.hiveBase);
    final String? token = myBase.get(Tags.hiveToken);
    print("URL://${Uris.likeVidoe}");
    print("token:= $token");
    if (token != null) {
      return await httpClient
          .post(Uris.likeVidoe,
              headers:
                  token != null ? Headers.bearer(token) : Headers.contentJson,
              body: jsonEncode({"id": id}))
          .then((response) {
        final res = json.decode(response.body);
        print("response likeVideo:=$res");
        if (response.statusCode == 200) {
          print("*** $res");
          return ResponseModel.frowJson(res);
        } else {
          print("Error in likeVideo!!! statusCode:${response.statusCode}");
          print("Error in likeVideo!!! :${response.body}");
          print("Error in likeVideo!!! :$id");
          return ResponseModel.frowJson(res);
        }
      });
    } else {
      return ResponseModel(result: "I need Token", status: false);
    }
  }

   @override
  Future<ResponseModel> likeImage(int id) async {
    final myBase = Hive.box(Tags.hiveBase);
    final String? token = myBase.get(Tags.hiveToken);
    print("URL://${Uris.likeImage}");
    print("token:= $token");
    if (token != null) {
      return await httpClient
          .post(Uris.likeImage,
              headers:
                  token != null ? Headers.bearer(token) : Headers.contentJson,
              body: jsonEncode({"id": id}))
          .then((response) {
        final res = json.decode(response.body);
        print("response likeImage:=$res");
        if (response.statusCode == 200) {
          print("*** $res");
          return ResponseModel.frowJson(res);
        } else {
          print("Error in likeImage!!! statusCode:${response.statusCode}");
          print("Error in likeImage!!! :${response.body}");
          print("Error in likeImage!!! :$id");
          return ResponseModel.frowJson(res);
        }
      });
    } else {
      return ResponseModel(result: "I need Token", status: false);
    }
  }

  @override
  Future<ResponseModel> viewVideo(int id) async {
    print("URL://${Uris.viewVideo}");
    return await httpClient
        .post(Uris.viewVideo,
            headers: Headers.contentJson, body: jsonEncode({"id": id}))
        .then((response) {
      final res = json.decode(response.body);
      print("response viewVideo:=$res");
      if (response.statusCode == 200) {
        print("*** $res");
        return ResponseModel.frowJson(res);
      } else {
        print("Error in viewVideo!!! statusCode:${response.statusCode}");
        print("Error in viewVideo!!! :${response.body}");
        print("Error in viewVideo!!! :$id");
        return ResponseModel.frowJson(res);
      }
    });
  }

  @override
  Future<ResponseModel> viewImage(int id) async {
    print("URL://${Uris.viewImage}");
    return await httpClient
        .post(Uris.viewImage,
            headers: Headers.contentJson, body: jsonEncode({"id": id}))
        .then((response) {
      final res = json.decode(response.body);
      print("response viewImage:=$res");
      if (response.statusCode == 200) {
        print("*** $res");
        return ResponseModel.frowJson(res);
      } else {
        print("Error in viewImage!!! statusCode:${response.statusCode}");
        print("Error in viewImage!!! :${response.body}");
        print("Error in viewImage!!! :$id");
        return ResponseModel.frowJson(res);
      }
    });
  }

  @override
  Future<int> badgeVideo() async {
    print("Video Badge = ${Uris.badgeVideo}");
    final response =
        await httpClient.get(Uris.badgeVideo, headers: Headers.contentJson);
    final badge = json.decode(response.body)["data"]["count"];
    if (response.statusCode == 200) {
      print("GalleryDataSourceImpl badgeVideo*** $badge");
      return badge;
    } else {
      print("Error in badgeVideo!!! statusCode:${response.statusCode}");
      print("Error in badgeVideo!!!:${response.body}");
      print("Error in badgeVideo!!! :$badge");
      return 0;
    }
  }

  @override
  Future<int> badgeImgs() async {
    print("Imgs Badge = ${Uris.badgeImgs}");
    final response =
        await httpClient.get(Uris.badgeVideo, headers: Headers.contentJson);
    final badge = json.decode(response.body)["data"]["count"];
    if (response.statusCode == 200) {
      print("GalleryDataSourceImpl badgeImgs*** $badge");
      return badge;
    } else {
      print("Error in badgeImgs!!! statusCode:${response.statusCode}");
      print("Error in badgeImgs!!!:${response.body}");
      print("Error in badgeImgs!!! :$badge");
      return 0;
    }
  }
}
