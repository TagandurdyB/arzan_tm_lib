class CheckEntity {
  final String uniqueId;
  final String phone;
  final bool isEmpty;

  CheckEntity({
    required this.uniqueId,
    required this.phone,
    this.isEmpty = true,
  });

  static CheckEntity get empty => CheckEntity(uniqueId: "", phone: "");

  factory CheckEntity.frowJson(Map<String, dynamic> json) {
    try {
      return CheckEntity(
        uniqueId: json["uniqueId"],
        phone: json["phone"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in CheckEntity : $err");
    }
  }

  Map<String, dynamic> toJson() => {
        "device_id": uniqueId,
        "phone": phone,
      };
}
