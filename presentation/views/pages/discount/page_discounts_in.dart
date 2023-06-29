// ignore_for_file: must_be_immutable

import 'package:arzan/presentation/views/widgets/custom_future.dart';

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

class DiscountsInPage extends StatefulWidget {
  final String title;
  final int id;
  final bool isSub;
  final int count;
  DiscountsInPage({
    required this.id,
    required this.isSub,
    required this.count,
    required this.title,
    super.key,
  });

  @override
  State<DiscountsInPage> createState() => _DiscountsInPageState();
}

class _DiscountsInPageState extends State<DiscountsInPage> {
  final _paginationControl = ScrollController();
  final double arentir = MySize.arentir;

  late DiscountProvid providD, providDdo;

  List<DiscountEntity> objs = [];

  late DiscountDataP providDD;

@override
void initState() {
  super.initState();
      _paginationControl.addListener(() {
      if (_paginationControl.position.maxScrollExtent ==
          _paginationControl.offset) {
        fetch();
      }
    });
}
  

    Future fetch() async {
    final discountDo = DiscountDataP.of(context, listen: false);
    if (!discountDo.isLast) {
      discountDo.fatchPosts(
        discountDo.discounts.length, 
        0,
        0);
    }
  }

  @override
  Widget build(BuildContext context) {
    providD = DiscountProvid.of(context);
    providDdo = DiscountProvid.of(context, listen: false);
    providDD = DiscountDataP.of(context);
    return ScaffoldNo(
      body: CustomFuture(
          future: widget.isSub
              ? providDD.fetchSubCategory(widget.id)
              : providDD.fetchCategoryD(widget.id),
          builder: (context, objs) {
            this.objs = objs;
            return Column(children: [
              CustomAppBar(
                titleW: Row(children: [
                  const SizedBox(
                    child: Text(
                      "Arzanladyşlar",
                      style: TextStyle(fontSize: 22),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    " (${providDD.badge})",
                    style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff008631)),
                  ),
                ]),
                actions: const [WidgetBtn()],
              ),
              Expanded(child: buildContent(context)),
            ]);
          }),
    );
  }

  Widget  buildContent(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      // SliverPadding(padding: const EdgeInsets.all(10), sliver: buildBanner),
      SliverAppBar(
        backgroundColor: Theme.of(context).canvasColor,
        pinned: true,
        leading: const SizedBox(),
        flexibleSpace: FlexibleSpaceBar(
            background: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "${widget.title} ${widget.count>0?"(${Formater.rounder(widget.count)})":""}",
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
