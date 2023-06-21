import '/presentation/views/widgets/widget_btn.dart';

import '../../screens/discounts/screen_categories.dart';
import '../../screens/discounts/screen_section.dart';
import '../../widgets/indicator_btns.dart';
import '/config/services/my_size.dart';
import '/presentation/providers/data/discount_data_provider.dart';

import '../../../providers/data/values_provider.dart';
import '../../../providers/view/provider_discaunts.dart';
import '../../widgets/carusel_slider.dart';
import '../../widgets/discount/discount_view.dart';
import '/presentation/views/scaffold/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../scaffold/no_app_bar_scaffold.dart';

class DiscountsPage extends StatefulWidget {
  const DiscountsPage({super.key});

  @override
  State<DiscountsPage> createState() => _DiscountsPageState();
}

class _DiscountsPageState extends State<DiscountsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      DiscountDataP.of(context, listen: false).fillDiscounts();
    });
    super.initState();
  }

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
            Text(
              "Arzanladyşlar",
              style: TextStyle(fontSize: 22),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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

  int selectPage = 0;

  Widget get buildContent {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      // SliverPadding(padding: const EdgeInsets.all(10), sliver: buildBanner),
      SliverList(
          delegate: SliverChildListDelegate([
        // buildBanner,
        Padding(
          padding: const EdgeInsets.all(16),
          child: IndicatorBtns(
            items: [
              IndicatorItem(text: "Hemmesi"),
              IndicatorItem(text: "Kategoriýa"),
              IndicatorItem(text: "Bölümler"),
            ],
            height: arentir * 0.11,
            activeColor: const Color(0xff00C52B),
            indicatorWidth: arentir * 0.3,
            indicatorBorder:
                Border.all(color: const Color(0xffE5E5E5), width: 2),
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: arentir * 0.015,
            onChange: (index) => setState(() => selectPage = index),
          ),
        ),
      ])),
      SliverPadding(
        padding: EdgeInsets.only(
            left: arentir * 0.02, right: arentir * 0.02, bottom: arentir * 0.3),
        sliver: selectPage == 0
            ? DiscountView(
                objs: providDD.discounts,
              )
            : selectPage == 1
                ? const DiscountCategories()
                : DiscountSections(),
      )
      // Expanded(
      //     child: SingleChildScrollView(
      //   physics: const BouncingScrollPhysics(),
      //   child: buildContent,
      // ))
    ]);
  }

  Widget get buildBanner {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: MyCarusel(
        items: ValuesP.of(context).banners,
      ),
    );
  }
}
