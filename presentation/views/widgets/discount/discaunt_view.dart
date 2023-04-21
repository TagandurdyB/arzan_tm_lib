import 'package:arzan_tm/presentation/providers/view/provider_discaunts.dart';
import 'package:arzan_tm/presentation/views/widgets/discount/discount_1_card.dart';
import 'package:arzan_tm/presentation/views/widgets/discount/discount_2_card.dart';
import 'package:arzan_tm/presentation/views/widgets/discount/discount_3_card.dart';

import '/config/system_info/my_size.dart';
import '/domanin/entities/discount_entity.dart';
import 'package:flutter/material.dart';

class DiscountView extends StatelessWidget {
  final List<DiscountEntity> objs;
  DiscountView({required this.objs, super.key});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    final int columnNum = DiscountProvid.of(context).cloumnCount;
    final int oldColumnNum = columnNum > 1 ? columnNum - 1 : 3;
    return SliverGrid.builder(
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: objs.length,
        gridDelegate: _delegate(columnNum),
        itemBuilder: (context, index) {
          // return buildDiscountCard(index, columnNum);
          return AnimatedCrossFade(
              firstChild: buildDiscountCard(index, columnNum),
              secondChild: buildDiscountCard(index, oldColumnNum),
              crossFadeState: columnNum == 2
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 1000));
        });
  }

  SliverGridDelegate _delegate(int columnNum) {
    switch (columnNum) {
      case 1:
        return SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: arentir * 0.05,
          mainAxisExtent: arentir * 0.48,
          crossAxisSpacing: arentir * 0.05,
          maxCrossAxisExtent: arentir * 1,
        );
      case 2:
        return SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: arentir * 0.05,
          mainAxisExtent: arentir * 0.48,
          crossAxisSpacing: arentir * 0.05,
          maxCrossAxisExtent: arentir * 0.5,
        );
      case 3:
        return SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: arentir * 0.05,
          mainAxisExtent: arentir * 0.48,
          crossAxisSpacing: arentir * 0.05,
          maxCrossAxisExtent: arentir * 0.4,
        );

      default:
        return SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: arentir * 0.05,
          mainAxisExtent: arentir * 0.48,
          crossAxisSpacing: arentir * 0.05,
          maxCrossAxisExtent: arentir * 0.5,
        );
    }
  }

  Widget buildDiscountCard(int index, int columnNum) {
    switch (columnNum) {
      case 1:
        return DiscountCardFirst(obj: objs[index]);
      case 2:
        return DiscountCardSecond(obj: objs[index]);
      case 3:
        return DiscountCardThird(obj: objs[index]);
      default:
        return DiscountCardSecond(obj: objs[index]);
    }
  }
}
