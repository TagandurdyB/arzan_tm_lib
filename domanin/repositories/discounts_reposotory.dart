import 'package:arzan_tm/domanin/entities/discounts/post_discount_entity.dart';
import 'package:arzan_tm/domanin/entities/register/response_entity.dart';

import '/domanin/entities/main_page/discount_entity.dart';

abstract class DiscountsRepository {
  Future<List<DiscountEntity>> getDiscounts();
  Future<ResponseEntity> postDiscount(PostDiscountEntity obj);
}
