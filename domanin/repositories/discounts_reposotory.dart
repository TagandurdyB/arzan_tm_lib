import '/domanin/entities/discounts/post_discount_entity.dart';
import '/domanin/entities/register/response_entity.dart';

import '../entities/discounts/discount_entity.dart';

abstract class DiscountsRepository {
  Future<List<DiscountEntity>> getDiscounts();
  Future<ResponseEntity> postDiscount(PostDiscountEntity obj);
}
