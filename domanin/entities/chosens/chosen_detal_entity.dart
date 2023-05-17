class ChosenDetalEntity {
  final int id;
  final List<String> images;
  final String title;
  final DateTime createdAt;
  final int viewed;
  final int liked;
  final String whom;
  final String message;
  final String phone;
  final String tags;
  final bool isEmpty;
  ChosenDetalEntity({
    required this.id,
    required this.images,
    required this.title,
    required this.viewed,
    required this.liked,
    required this.whom,
    required this.message,
    required this.phone,
    required this.tags,
    required this.createdAt,
    this.isEmpty = true,
  });

  static ChosenDetalEntity get empty => ChosenDetalEntity(
        id: 0,
        images: [],
        title: "",
        viewed: 0,
        liked: 0,
        whom: "",
        message: "",
        phone: "",
        tags: "",
        createdAt: DateTime.now(),
      );

  factory ChosenDetalEntity.frowJson(Map<String, dynamic> json) {
    try {
      return ChosenDetalEntity(
        id: json["id"],
        images: json["images"],
        title: json["title"],
        viewed: json["viewed"],
        liked: json["liked"],
        whom: json["whom"],
        message: json["message"],
        phone: json["phone"],
        tags: json["tags"],
        createdAt: json["createdAt"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in ChosenEntity : $err");
    }
  }

  static List<ChosenDetalEntity> fromJsonList(
          List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => ChosenDetalEntity.frowJson(json)).toList();
}
