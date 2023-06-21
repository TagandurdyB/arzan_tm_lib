import 'dart:convert';

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
final res=json.decode(response.body);
    if (response.statusCode == 200) {
      print("GalleryDataSourceImpl getVideos*** $res");
      return ResponseModel.frowJson(json.decode(response.body));
    } else {
      print("Error in postSignUp!!! statusCode:${response.statusCode}");
      print("Error in postSignUp!!!:${response.body}");
      print("Error in postSignUp!!! :${obj.toJson()}");
      return ResponseModel.frowJson(json.decode(response.body));
    }
  }
}
