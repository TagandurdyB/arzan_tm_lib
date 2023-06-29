import '../user_entity.dart';

class ContentCardEntity {
  final int id;
  final UserEntity user;
  final String banerImg;
  final DateTime? createdAt;
  final int viewed;
  final String title;
  final String videoUrl;
  final int allCount;
  final int likeCount;
  final bool pinnad;
  final bool isLiked;
  final bool isPicture;
  final bool isEmpty;

  ContentCardEntity({
    required this.id,
    required this.user,
    required this.banerImg,
    this.createdAt,
    required this.viewed,
    required this.title,
     this.videoUrl="",
    required this.allCount,
    required this.likeCount,
    this.isLiked=false,
    this.pinnad = false,
    this.isPicture = false,
    this.isEmpty = true,
  });

  static ContentCardEntity empty() => ContentCardEntity(
      id: 0,
      user: UserEntity.empty,
      banerImg: "",
      videoUrl: "",
      viewed: 0,
      likeCount: 0,
      title: "",
      allCount: 0);



  // factory ContentCardEntity.frowJson(Map<String, dynamic> json) =>
  //     ContentCardEntity(
  //       id: json["id"],
  //       userName: json["name"],
  //       userImg: json["user_img"],
  //       banerImg: json["baner_img"],
  //       thumbinalImg: json["thumbinal_img"],
  //       videoUrl: json["video_url"],
  //       name: json["about"],
  //       allCount: json["all_count"],
  //       allViewed: json["all_viewed"],
  //       allShaered: json["all_shaered"],
  //       contents: ImgCardEntity.frowJsonList(json["contents"]),
  //       isEmpty: false,
  //     );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": userName,
  //       "userImg": userImg,
  //       "banerImg": banerImg,
  //       "thumbinalImg": thumbinalImg,
  //       "videoUrl": videoUrl,
  //       "about": userImg,
  //       "allCount": allCount,
  //       "allViewed": allViewed,
  //       "allShaered": allShaered,
  //       "cintents": contents,
  //       "isEmpty": isEmpty,
  //     };
}
