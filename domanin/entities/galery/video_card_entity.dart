class VideoCardEntity {
  final int id;
  final String video;
  final String thumbnailUrl;
  final String name;
  final int viewed;
  final int liked;
  // final int allCount;
  final int shaered;
  final bool isEmpty;
  VideoCardEntity({
    required this.id,
    this.video = "",
    this.thumbnailUrl = "",
    this.name = "",
    this.viewed = 0,
    this.liked = 0,
    this.shaered = 0,
    this.isEmpty = true,
  });

  static VideoCardEntity empty() => VideoCardEntity(id: 0);

  factory VideoCardEntity.frowJson(Map<String, dynamic> json) =>
      VideoCardEntity(
        id: json["id"],
        video: json["video"],
        thumbnailUrl: json["thumbnailUrl"],
        name: json["name"],
        viewed: json["viewed"],
        liked: json["liked"],
        shaered: json["shaered"],
        isEmpty: false,
      );

  // static List<VideoCardEntity> frowJsonList(List<Map<String, dynamic>> json) =>
  //     json
  //         .map((e) => VideoCardEntity(
  //               id: e["id"],
  //               img: e["img"],
  //               viewed: e["viewed"],
  //               liked: e["liked"],
  //               isEmpty: false,
  //             ))
  //         .toList();

  Map<String, dynamic> toJson() => {
        "id": id,
        "video": video,
        "thumbnailUrl": thumbnailUrl,
        "name": name,
        "viewed": viewed,
        "liked": liked,
        "shaered": shaered,
        "isEmpty": isEmpty,
      };
}
