class DiscoutSectionEntity {
  final int id;
  final String serviceImg;
  final String serviceName;
  final List<String> locations;
  final String date;
  final int sum;
  final bool status;
  DiscoutSectionEntity({
    required this.id,
    required this.serviceImg,
    required this.serviceName,
    required this.locations,
    required this.date,
    required this.sum,
    required this.status,
  });
}
