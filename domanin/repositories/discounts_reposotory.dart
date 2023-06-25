import '../entities/discounts/discount_category_entity.dart';
import '../entities/discounts/discount_detal_entity.dart';
import '/domanin/entities/discounts/post_discount_entity.dart';
import '/domanin/entities/register/response_entity.dart';

import '../entities/discounts/discount_entity.dart';

abstract class DiscountsRepository {
  Future<List<DiscountEntity>> getDiscounts();
  Future<DiscountDetalEntity> getDetal(int id);
  Future<ResponseEntity> postDiscount(PostDiscountEntity obj);
  Future<List<DiscountCategoryEntity>> discountCategories();
  Future<List<DiscountEntity>> categoryPost(int id);
  Future<List<DiscountEntity>> subCategoryPost(int id);

  // Future<List<DiscountSubcategoryEntity>> discountSubs(int categoryID);
}
