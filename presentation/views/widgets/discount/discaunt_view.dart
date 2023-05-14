import '/domanin/entities/main_page/discount_entity.dart';

import '/presentation/providers/view/provider_discaunts.dart';
import '/presentation/views/widgets/discount/discount_2_card.dart';

import 'package:entry/entry.dart';

import '../../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

import 'discount_1_card.dart';
import 'discount_3_card.dart';

class DiscountView extends StatefulWidget {
  final List<DiscountEntity> objs;
  const DiscountView({required this.objs, super.key});

  @override
  State<DiscountView> createState() => _DiscountViewState();
}

class _DiscountViewState extends State<DiscountView> {
  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    final providD = DiscountProvid.of(context);
    return SliverGrid.builder(
        itemCount: widget.objs.length,
        gridDelegate: _delegateChanger(providD.cloumnCount),
        itemBuilder: (context, index) {
          return Entry.scale(
              visible: providD.scaleVisible,
              scale: 0,
              curve: Curves.easeInOut,
              // delay: const Duration(milliseconds: 40),
              duration: const Duration(milliseconds: 300),
              child: buildDiscountCard(index, providD.cloumnCount));
        });
  }

  SliverGridDelegate _delegateChanger(int columnNum) {
    switch (columnNum) {
      case 1:
        return _delegate(0.05, 0.29, 1);
      case 2:
        return _delegate(0.05, 0.48, 0.5);
      case 3:
        return _delegate(0.05, 0.37, 0.4);
      default:
        return _delegate(0.05, 0.46, 0.5);
    }
  }

  SliverGridDelegate _delegate(double mainSp, double mainEx, double crossEx) {
    return SliverGridDelegateWithMaxCrossAxisExtent(
      mainAxisSpacing: arentir * mainSp,
      mainAxisExtent: arentir * mainEx,
      maxCrossAxisExtent: arentir * crossEx,
    );
  }

  Widget buildDiscountCard(int index, int columnNum) {
    switch (columnNum) {
      case 1:
        return DiscountCardFirst(obj: widget.objs[index]);
      case 2:
        return DiscountCardSecond(obj: widget.objs[index]);
      case 3:
        return DiscountCardThird(obj: widget.objs[index]);
      default:
        return DiscountCardSecond(obj: widget.objs[index]);
    }
  }
}
