class SearchEntity {
  final String imageUrl;
  final String title;
  final DateTime created;
  final int viewed;
  final int id;
  final bool isEmpty;
  SearchEntity({
    required this.created,
    required this.viewed,
    this.title = "",
    this.id = 0,
    required this.imageUrl,
    this.isEmpty = false,
  });

  static SearchEntity empty() => SearchEntity(
        created: DateTime.now(),
        viewed: 0,
        imageUrl: "Url",
        isEmpty: true,
      );

  factory SearchEntity.frowJson(Map<String, dynamic> json) => SearchEntity(
        imageUrl: json["image"],
        created: json["created_time"],
        viewed: json["viewed"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": imageUrl,
        "id": id,
      };
}
