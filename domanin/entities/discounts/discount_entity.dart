import 'package:hive/hive.dart';
part 'discount_entity.g.dart';

@HiveType(typeId: 0)
class DiscountEntity extends HiveObject{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int mod;
  @HiveField(2)
  final int viewed;
  @HiveField(3)
  final String img;
  @HiveField(4)
  final DateTime createdAt;
  @HiveField(5)
  final String title;
  @HiveField(6)
  DiscountEntity({
    required this.id,
    required this.mod,
    required this.viewed,
    required this.img,
    required this.createdAt,
    required this.title,
  });

  static DiscountEntity get empty => DiscountEntity(
        id: 0,
        mod: 0,
        viewed: 0,
        img: "",
        createdAt: DateTime.now(),
        title: "",
      );
}
