import 'package:arzan_tm/domanin/entities/discounts/discount_entity.dart';
import 'package:arzan_tm/presentation/views/scaffold/custom_app_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domanin/entities/hive_boxes.dart';
import '../../providers/data/discount_data_provider.dart';
import '../widgets/discount/discount_view.dart';
import '../widgets/indicator_btns.dart';
import '../widgets/widget_btn.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../config/services/my_size.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final double arentir = MySize.arentir;

  int selectPage = 0;

  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).canvasColor,
            pinned: true,
            leading: const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(
                background: CustomAppBar(
                    title: "Bellenenler", actions: const [WidgetBtn()])),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: IndicatorBtns(
                items: [
                  IndicatorItem(text: "Post"),
                  IndicatorItem(text: "Surat"),
                  IndicatorItem(text: "Wideo"),
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
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: arentir * 0.02, vertical: arentir * 0.03),
            sliver: selectPage == 0
                ? buildPosts()
                : selectPage == 1
                    ? buildPictures()
                    : buildVideos(),
          ),
        ],
      ),
    );
  }

  Widget buildPosts() {
    return ValueListenableBuilder(
        valueListenable: Boxes.getFavoriteDiscounts().listenable(),
        builder: (context, box, _) {
          return DiscountView(
            // objs: objM.discountDatas,
            objs: box.values.toList().cast<DiscountEntity>(),
          );
        });
  }

  Widget buildPictures() {
    return DiscountView(
      // objs: objM.discountDatas,
      objs: [DiscountDataP.of(context).discounts[0]],
    );
  }

  Widget buildVideos() {
    return DiscountView(
      // objs: objM.discountDatas,
      objs: [DiscountDataP.of(context).discounts[1]],
    );
  }
}
