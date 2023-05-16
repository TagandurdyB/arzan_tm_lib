import 'package:arzan_tm/config/services/my_size.dart';
import 'package:arzan_tm/presentation/providers/data/discount_data_provider.dart';

import '../../providers/data/banner_provider.dart';
import '../../providers/view/provider_discaunts.dart';
import '../widgets/carusel_slider.dart';
import '../widgets/discount/discaunt_view.dart';
import '/presentation/views/scaffold/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../scaffold/no_app_bar_scaffold.dart';

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
          title: "Arzanladyşlar",
          actions: [
            GestureDetector(
                onTap: () => providDdo.tongleColumn,
                child: Icon(buildWidgetIconD(providD.cloumnCount)))
          ],
        ),
        Expanded(child: buildContent),
      ]),
    );
  }

  IconData buildWidgetIconD(int cloumnCount) {
    switch (cloumnCount) {
      case 1:
        return Icons.list;
      case 2:
        return Icons.widgets_outlined;
      case 3:
        return Icons.apps_sharp;

      default:
        return Icons.list;
    }
  }

  Widget get buildContent {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      // SliverPadding(padding: const EdgeInsets.all(10), sliver: buildBanner),
      SliverList(
          delegate: SliverChildListDelegate([
        buildBanner,
      ])),
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: arentir * 0.02),
        sliver: DiscountView(
          objs: providDD.discounts,
        ),
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
        items: BannerP.of(context).baners,
      ),
    );
  }
}
