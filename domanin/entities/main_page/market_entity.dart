class MarketEntity {
  final int id;
  final int mod;
  final String logo;
  final String name;
  final bool isEmpty;
  MarketEntity({
    required this.id,
    required this.mod,
    required this.logo,
    required this.name,
    this.isEmpty=true,
  });

  static MarketEntity get empty => MarketEntity(
        id: 0,
        mod: 0,
        logo: "",
        name: "",
      );

  factory MarketEntity.frowJson(Map<String, dynamic> json) {
    try {
      return MarketEntity(
        id: json["id"],
        mod: json["mod"],
        logo: json["img"],
        name: json["name"],
        isEmpty: false,
      );
    } catch (err) {
      throw("Error in MarketEntity : $err");
    }
  }

  static List<MarketEntity> fromJsonList(List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => MarketEntity.frowJson(json)).toList();
}