// ignore_for_file: must_be_immutable

import '/presentation/views/widgets/widget_btn.dart';

import '../../../../config/vars/formater.dart';
import '/domanin/entities/discounts/discount_entity.dart';

import '/config/services/my_size.dart';
import '/presentation/providers/data/discount_data_provider.dart';

import '../../../providers/view/provider_discaunts.dart';
import '../../widgets/discount/discount_view.dart';
import '/presentation/views/scaffold/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../scaffold/no_app_bar_scaffold.dart';

class DiscountsInPage extends StatelessWidget {
  final List<DiscountEntity> objs;
  final String title;
  final int count;
  DiscountsInPage({
    required this.objs,
    required this.count,
    required this.title,
    super.key,
  });

  final double arentir = MySize.arentir;
  late DiscountProvid providD, providDdo;

  late DiscountDataP providDD;
  @override
  Widget build(BuildContext context) {
    providD = DiscountProvid.of(context);
    providDdo = DiscountProvid.of(context, listen: false);
    providDD = DiscountDataP.of(context);
    return ScaffoldNo(
      body: Column(children: [
        CustomAppBar(
          titleW: Row(children: const [
            SizedBox(
              child: Text(
                "Arzanladyşlar",
                style: TextStyle(fontSize: 22),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              " (135)",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff008631)),
            ),
          ]),
          actions: const [WidgetBtn()],
        ),
        Expanded(child: buildContent),
      ]),
    );
  }

  Widget get buildContent {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      // SliverPadding(padding: const EdgeInsets.all(10), sliver: buildBanner),
      SliverAppBar(
        backgroundColor: Colors.transparent,
        pinned: true,
        leading: const SizedBox(),
        flexibleSpace: FlexibleSpaceBar(
            background: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "$title (${Formater.rounder(count)})",
            style: TextStyle(
                fontSize: arentir * 0.04, overflow: TextOverflow.ellipsis),
            maxLines: 1,
          ),
        )),
      ),
      SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: arentir * 0.02),
          sliver: DiscountView(
            // objs: providDD.discounts,
            objs: objs,
          ))
    ]);
  }
}
