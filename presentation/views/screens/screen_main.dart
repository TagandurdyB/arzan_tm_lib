// ignore_for_file: must_be_immutable

import '/domanin/entities/main_page/main_page_entity.dart';

import '../../providers/data/main_page_provider.dart';
import '/presentation/providers/view/provider_navigation.dart';
import '/presentation/views/screens/screen_search.dart';

import '../widgets/all_btn.dart';
import '../widgets/carusel_slider.dart';
import '../widgets/double_card.dart';
import '../widgets/main_markets_view.dart';
import '../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/my_route.dart';
import '../scaffold/my_app_bar.dart';
import '../widgets/card_title.dart';
import '../widgets/chosen_page_view.dart';
import '../widgets/discount/discaunt_view.dart';
import '../widgets/long_card.dart';

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
    objM = MainPageP.of(context).entity;
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
            MainMarketsView(objs: objM.markets),
            buildSliverList(context),
          ])),
          SliverAppBar(
            backgroundColor: Theme.of(context).canvasColor,
            pinned: true,
            leading: const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(background: buildSliverTitle()),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: arentir * 0.02),
            sliver: DiscountView(
              objs: objM.discountDatas,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliverList(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            LongCard(
                counter: objM.konkurs.count,
                btnFunc: () {},
                imageUrl: objM.konkurs.img,
                title: "Konkurs"),
            ChosenPageView(
              allBtnOnTap: () => Navigator.pushNamed(context, Rout.chosen),
              objs: objM.saylananlarDatas,
            ),
            LongCard(
                counter: 65,
                btnFunc: () => Navigator.pushNamed(context, Rout.tops),
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr3MuW1xVojkwEii52GvQNrmqFBZpDQqf7Rg&usqp=CAU",
                title: "Top"),
            DoubleCard(
              firstOnTab: () => Navigator.pushNamed(context, Rout.images),
              secondOnTab: () => Navigator.pushNamed(context, Rout.videos),
              firstCounter: 65,
              firstImageUrl:
                  "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__480.jpg",
              firstTitle: "Suratlar",
              secondCounter: 7,
              secondImageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlPND0tOQwofutiyYIW6s9k6qWUmozNNGykfYgrKIa7b0LlmMvdpBH92wnwdvhGKqwQnY&usqp=CAU",
              secondTitle: "Wideolar",
            ),
            LongCard(
                counter: 65,
                btnFunc: () {},
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr3MuW1xVojkwEii52GvQNrmqFBZpDQqf7Rg&usqp=CAU",
                title: "Resmiler"),
          ],
        ),
      );

  Widget get buildSlider {
    return Align(
      alignment: Alignment.topCenter,
      // child: CustomCarusel(
      //   dotColor: Colors.black26,
      //   activDotColor: const Color(0xff0EC243),
      //   borderRadius: MySize.arentir * 0.02,
      //   items: List.generate(
      //       imgs.length, (index) => ShimmerImg(imageUrl: imgs[index])),
      // ),
      child: MyCarusel(
        items: objM.baners.map((e) => e).toList(),
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
              // GestureDetector(
              //     onTap: () {
              //       DiscountProvid.of(context, listen: false).tongleColumn;
              //     },
              //     child: Icon(
              //         buildColumnIcon(DiscountProvid.of(context).cloumnCount))),
              AllBtn(
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  IconData buildColumnIcon(int columnCount) {
    switch (columnCount) {
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
}
