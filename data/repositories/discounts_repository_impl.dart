import 'package:arzan_tm/domanin/entities/discounts/post_discount_entity.dart';
import 'package:arzan_tm/domanin/entities/register/response_entity.dart';

import '../datasourses/remote/discounts_remote_datasource.dart';
import '../models/post_discount_model.dart';
import '/domanin/entities/main_page/discount_entity.dart';

import '../../domanin/repositories/discounts_reposotory.dart';

class DiscountsRepositoryImpl implements DiscountsRepository {
  final DiscountsRemoteDataSource discountsRemoteDataSource;
  DiscountsRepositoryImpl(this.discountsRemoteDataSource);
  @override
  Future<List<DiscountEntity>> getDiscounts() async {
    return await discountsRemoteDataSource.getDiscounts();
  }

  @override
  Future<ResponseEntity> postDiscount(PostDiscountEntity obj) async {
    final model = await discountsRemoteDataSource
        .postDiscount(PostDiscountModel.fromEntity(obj));
    return model;
  }
}
