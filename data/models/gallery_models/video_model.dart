// ignore_for_file: override_on_non_overriding_member, overridden_fields

import 'package:arzan/data/models/user_model.dart';

import '../../../domanin/entities/galery/video_entity.dart';

class VideoCardModel extends VideoCardEntity {
  @override
  final int id;
  @override
  final String thumbinalImg;
  @override
  final String title;
  @override
  final DateTime createdAt;
  @override
  final int viewCount;
  @override
  final UserModel user;
  @override
  final int? next;
  @override
  final int? provious;
  @override
  final bool isEmpty;
  VideoCardModel({
    required this.id,
    required this.thumbinalImg,
    required this.title,
    required this.createdAt,
    required this.viewCount,
    required this.user,
    this.next,
    this.provious,
    this.isEmpty = true,
  }) : super(
            id: id,
            createdAt: createdAt,
            thumbinalImg: thumbinalImg,
            title: title,
            user: user,
            viewCount: viewCount);

  static VideoCardModel empty() => VideoCardModel(
      id: 0,
      thumbinalImg: "",
      title: "",
      user: UserModel.empty,
      createdAt: DateTime.now(),
      viewCount: 0);

  factory VideoCardModel.frowJson(Map<String, dynamic> json) => VideoCardModel(
        id: json["id"],
        thumbinalImg: json["thumbnail"]["url"],
        title: json["title"],
        createdAt: DateTime.parse(json["created_at"]),
        viewCount: json["viewed_count"],
        user: UserModel.fromJson(json["user"]),
        next: json["next"],
        provious: json["provious"],
        isEmpty: false,
      );

  static List<VideoCardModel> frowJsonList(List jsonList) =>
      jsonList.map((json) => VideoCardModel.frowJson(json)).toList();
}

class VideoModel extends VideoEntity {
  @override
  final String title;
  @override
  final String videoUrl;
  @override
  final int likeCount;
  @override
  final UserModel user;
  @override
  final int? next;
  @override
  final int? provious;
  @override
  final bool isEmpty;
  VideoModel({
    required this.title,
    required this.videoUrl,
    required this.likeCount,
    required this.user,
    this.next,
    this.provious,
    this.isEmpty = true,
  }) : super(title: '', videoUrl: '', likeCount: 0, user: user);

  static VideoModel empty() =>
      VideoModel(title: "", videoUrl: "", likeCount: 0, user: UserModel.empty);

  factory VideoModel.frowJson(Map<String, dynamic> json) => VideoModel(
        likeCount: json["likeCount"],
        title: json["title"],
        videoUrl: json["videoUrl"],
        user: UserModel.fromJson(json["user"]),
        next: json["next"],
        provious: json["provious"],
        isEmpty: false,
      );
}
