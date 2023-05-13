class ChosenEntity {
  final int id;
  final String img;
  final String name;
  final DateTime createdAt;
  final bool isEmpty;
  ChosenEntity({
    required this.id,
    required this.img,
    required this.name,
    required this.createdAt,
    this.isEmpty=true,
  });

  static ChosenEntity get empty => ChosenEntity(
        id: 0,
        img: "",
        name: "",
        createdAt: DateTime.now(),
      );

  factory ChosenEntity.frowJson(Map<String, dynamic> json) {
    try {
      return ChosenEntity(
        id: json["id"],
        img: json["img"],
        name: json["name"],
        createdAt: json["created_at"],
        isEmpty: false,
      );
    } catch (err) {
      throw("Error in ChosenEntity : $err");
    }
  }

  static List<ChosenEntity> fromJsonList(List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => ChosenEntity.frowJson(json)).toList();
}