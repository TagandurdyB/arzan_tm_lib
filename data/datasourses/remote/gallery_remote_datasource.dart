import 'dart:convert';

import 'package:arzan/data/models/user_model.dart';

import '../../../config/vars/constants.dart';
import '/data/models/gallery_models/video_model.dart';
import 'package:http/http.dart' as http;

import 'http_vars.dart';

abstract class GalleryRemoteDataSource {
  Future<List<VideoCardModel>> getVideos();
  Future<VideoModel> getVideo(int id);
}

class GalleryDataSourceImpl implements GalleryRemoteDataSource {
  final http.Client httpClient;
  GalleryDataSourceImpl(this.httpClient);

  @override
  Future<List<VideoCardModel>> getVideos() async {
    print("URL://${Uris.videoCards}");
    final response =
        await httpClient.get(Uris.videoCards, headers: Headers.contentJson);
    final res = json.decode(response.body);
    if (response.statusCode == 200) {
      print("GalleryDataSourceImpl getVideos*** $res");
      return VideoCardModel.frowJsonList(res);
    } else {
      print("Error in getVideos!!! statusCode:${response.statusCode}");
      print("Error in getVideos!!!:${response.body}");
      print("Error in getVideos!!! :$res");
      return VideoCardModel.frowJsonList(res);
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

    return Future.delayed(Duration(seconds: 3)).then((value) => VideoModel(
        title: "Loremssdada sdas fsadf asdf sadf d",
        videoUrl:
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
        likeCount: 1243,
        user: UserModel(
            avatarImg: "", id: 1, name: "100Haryt", role: Role.Official)));
  }
}
