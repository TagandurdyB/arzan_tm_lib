// ignore_for_file: overridden_fields

import '/domanin/entities/galery/video_card_entity.dart';

class VideoModel extends VideoCardEntity {
  @override
  final int id;
  @override
  final String thumbinalImg;
  @override
  final String videoUrl;
  @override
  final int liked;
  @override
  final bool isEmpty;
  VideoModel({
    required this.id,
    required this.thumbinalImg,
    required this.videoUrl,
    this.liked = 0,
    this.isEmpty = true,
  }) : super(id: id, thumbinalImg: thumbinalImg, videoUrl: videoUrl);

  static VideoModel empty() =>
      VideoModel(id: 0, thumbinalImg: "", videoUrl: "");

  factory VideoModel.frowJson(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        thumbinalImg: json["thumbinalImg"],
        videoUrl: json["videoUrl"],
        liked: json["liked"],
        isEmpty: false,
      );

  static List<VideoModel> frowJsonList(List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => VideoModel.frowJson(json)).toList();

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "thumbinalImg": thumbinalImg,
        "videoUrl": videoUrl,
        "liked": liked,
        "isEmpty": isEmpty,
      };
}
