// ignore_for_file: must_be_immutable

import '/presentation/providers/data/discount_data_provider.dart';

import '../widgets/widget_btn.dart';
import '/domanin/entities/main_page/main_new_officials_entity.dart';
import 'package:provider/provider.dart';

import '../../providers/data/values_provider.dart';
import '../widgets/main_page_widgets/main_new_officials.dart';
import '/domanin/entities/main_page/main_page_entity.dart';

import '../../providers/data/main_page_provider.dart';
import '/presentation/providers/view/provider_navigation.dart';
import '/presentation/views/screens/screen_search.dart';

import '../widgets/carusel_slider.dart';
import '../widgets/main_page_widgets/double_card.dart';
import '../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/my_route.dart';
import '../scaffold/my_app_bar.dart';
import '../widgets/card_title.dart';
import '../widgets/chosen/chosen_page_view.dart';
import '../widgets/discount/discount_view.dart';
import '../widgets/main_page_widgets/long_card.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  final double arentir = MySize.arentir;

  @override
  late BuildContext context;

  late MainPageEntity objM;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      MainPageP.of(context, listen: false).fillEntity();
      DiscountDataP.of(context, listen: false).fillDiscounts();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    // objM = MainPageP.of(context).entity;
    objM = context.watch<MainPageP>().entity;
    return Column(
      children: [
        // ProviderNav.of(context).isSearch ? SearchBar() : MainBar(),
        const MainBar(),
        Expanded(
            child: Stack(
          children: [
            buildContent,
            Offstage(
                offstage: !ProviderNav.of(context).isSearch,
                child: ScreenSearch())
          ],
        )),
      ],
    );
  }

  Scaffold get buildContent {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            buildSlider,
            // MainMarketsView(objs: objM.markets),
            buildSliverList(context),
          ])),
          SliverAppBar(
            backgroundColor: Theme.of(context).canvasColor,
            pinned: true,
            leading: const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(background: buildSliverTitle()),
          ),
          const SliverPadding(padding: EdgeInsets.all(10)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: arentir * 0.02),
            sliver: DiscountView(
              // objs: objM.discountDatas,
              objs: DiscountDataP.of(context).discounts,
            ),
          ),
          const SliverPadding(padding: EdgeInsets.all(20))
        ],
      ),
    );
  }

  Widget buildSliverList(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // LongCard(
            //     counter: objM.konkurs.count,
            //     onTap: () => Navigator.pushNamed(context, Rout.contest),
            //     imageUrl: objM.konkurs.img,
            //     title: "Konkurs"),
            ChosenPageView(
              allBtnOnTap: () => Navigator.pushNamed(context, Rout.chosen),
              objs: objM.saylananlarDatas,
              count: objM.saylananlarCount,
            ),
            LongCard(
                counter: objM.top.count,
                onTap: () => Navigator.pushNamed(context, Rout.tops),
                imageUrl: objM.top.img,
                title: "Top hasaplar"),
            DoubleCard(
              firstOnTab: () => Navigator.pushNamed(context, Rout.images),
              secondOnTab: () => Navigator.pushNamed(context, Rout.videos),
              firstCounter: objM.pictures.count,
              firstImageUrl: objM.pictures.img,
              firstTitle: "Suratlar",
              secondCounter: objM.videos.count,
              secondImageUrl: objM.videos.img,
              secondTitle: "Wideolar",
            ),
            LongCard(
                counter: objM.resmiler.count,
                onTap: () => Navigator.pushNamed(context, Rout.officials),
                imageUrl: objM.resmiler.img,
                title: "Resmiler"),
            MainNewOfficials(
              objs: [
                NewOfficialsEntity(
                    id: 1,
                    officialImg:
                        "https://play-lh.googleusercontent.com/326hZ9pubFetmymUcBe3ZX0gTG_DLdjiDdkleC04Gft-YtiJrBzGrQPNJGqghy6Nfg=w240-h480-rw"),
                NewOfficialsEntity(
                    id: 2,
                    officialImg:
                        "https://play-lh.googleusercontent.com/tIM6b_64ciHqKwP7dxoO1SAJtRIp0sqhaO2lv75-fbdoTqy7d3R8XMSfj35YS4OeG3E"),
                NewOfficialsEntity(
                    id: 3,
                    officialImg:
                        "https://play-lh.googleusercontent.com/326hZ9pubFetmymUcBe3ZX0gTG_DLdjiDdkleC04Gft-YtiJrBzGrQPNJGqghy6Nfg=w240-h480-rw"),
                NewOfficialsEntity(
                    id: 4,
                    officialImg:
                        "https://play-lh.googleusercontent.com/tIM6b_64ciHqKwP7dxoO1SAJtRIp0sqhaO2lv75-fbdoTqy7d3R8XMSfj35YS4OeG3E"),
              ],
            ),
          ],
        ),
      );

  Widget get buildSlider {
    final banner = context.watch<ValuesP>().banners;
    return Container(
      alignment: Alignment.topCenter,
      // child: CustomCarusel(
      //   dotColor: Colors.black26,
      //   activDotColor: const Color(0xff0EC243),
      //   borderRadius: MySize.arentir * 0.02,
      //   items: List.generate(
      //       imgs.length, (index) => ShimmerImg(imageUrl: imgs[index])),
      // ),
      padding: const EdgeInsets.all(16),
      child: MyCarusel(
        items: banner,
      ),
    );
  }

  Widget buildSliverTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardTitle(counter: objM.discountsCount, title: "Arzanladyşlar"),
          // CardTitle(counter: objM.discountDatas.length, title: "Arzanladyşlar"),
          Row(
            children: [
              const WidgetBtn(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Rout.discounts);
                  // BannerP.of(context, listen: false)
                  //     .fillBanner("Balkan", "Discount")
                  //     .then((value) =>
                  //         Navigator.pushNamed(context, Rout.discounts));
                },
                child: const Text(
                  "Hemmesi",
                  style: TextStyle(color: Color(0xff008631)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
