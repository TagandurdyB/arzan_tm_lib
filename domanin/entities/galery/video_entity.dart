import 'package:arzan/domanin/entities/user_entity.dart';

class VideoCardEntity {
  final int id;
  final String thumbinalImg;
  final String title;
  final DateTime createdAt;
  final int viewCount;
  final UserEntity user;
  final bool isEmpty;
  VideoCardEntity({
    required this.id,
    required this.thumbinalImg,
    required this.title,
    required this.createdAt,
    required this.user,
    required this.viewCount,
    this.isEmpty = true,
  });
}

class VideoEntity {
  final String title;
  final String videoUrl;
  final int likeCount;
  final UserEntity user;
  final int? next;
  final int? provious;
  final bool isEmpty;
  VideoEntity({
    required this.title,
    required this.videoUrl,
    required this.likeCount,
    required this.user,
    this.next,
    this.provious,
    this.isEmpty = true,
  });

  static VideoEntity get empty => VideoEntity(
      title: "", videoUrl: "", likeCount: 0, user: UserEntity.empty);
}
