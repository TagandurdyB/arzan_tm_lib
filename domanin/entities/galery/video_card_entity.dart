class VideoCardEntity {
  final int id;
  final String thumbinalImg;
  final String videoUrl;
  final int liked;
  final bool isEmpty;
  VideoCardEntity({
    required this.id,
    required this.thumbinalImg,
    required this.videoUrl,
    this.liked = 0,
    this.isEmpty = true,
  });

  static VideoCardEntity empty() =>
      VideoCardEntity(id: 0, thumbinalImg: "", videoUrl: "");

  factory VideoCardEntity.frowJson(Map<String, dynamic> json) =>
      VideoCardEntity(
        id: json["id"],
        thumbinalImg: json["thumbinalImg"],
        videoUrl: json["videoUrl"],
        liked: json["liked"],
        isEmpty: false,
      );

  static List<VideoCardEntity> frowJsonList(
          List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => VideoCardEntity.frowJson(json)).toList();

  Map<String, dynamic> toJson() => {
        "id": id,
        "thumbinalImg": thumbinalImg,
        "videoUrl": videoUrl,
        "liked": liked,
        "isEmpty": isEmpty,
      };
}
