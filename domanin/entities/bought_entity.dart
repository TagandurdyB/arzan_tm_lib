class BoughtServiceEntity {
  final String serviceImg;
  final String serviceName;
  final List<String> locations;
  final String date;
  final int sum;
  final bool status;
  BoughtServiceEntity({
    required this.serviceImg,
    required this.serviceName,
    required this.locations,
    required this.date,
    required this.sum,
    required this.status,
  });
}
