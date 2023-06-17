import '../../config/vars/constants.dart';
import '/domanin/entities/discounts/discount_entity.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<DiscountEntity> getFavoriteDiscounts() =>
      Hive.box<DiscountEntity>(Tags.hiveFavorites);
}
