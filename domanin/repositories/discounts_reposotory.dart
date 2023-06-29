import '../entities/discounts/discount_category_entity.dart';
import '../entities/discounts/discount_detal_entity.dart';
import '/domanin/entities/discounts/post_discount_entity.dart';
import '/domanin/entities/register/response_entity.dart';

import '../entities/discounts/discount_entity.dart';

abstract class DiscountsRepository {
  Future<List<DiscountEntity>> getDiscounts(
      int limit, int offset, int categoryId, int subId);
  Future<DiscountDetalEntity> getDetal(int id);
  Future<ResponseEntity> postDiscount(PostDiscountEntity obj);
  Future<List<DiscountCategoryEntity>> discountCategories();

  Future<List<DiscountEntity>> searchPost(String text);
  Future<List<DiscountEntity>> selfPost(int id);

  Future<List<DiscountEntity>> categoryPost(int id);
  Future<List<DiscountEntity>> subCategoryPost(int id);

  Future<int> badgePost();

  // Future<List<DiscountSubcategoryEntity>> discountSubs(int categoryID);
}
