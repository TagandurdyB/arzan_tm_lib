// ignore_for_file: must_be_immutable

import '/presentation/providers/view/provider_navigation.dart';
import '/presentation/views/screens/screen_search.dart';

import '/domanin/entities/carusel_entity.dart';
import '/domanin/entities/main_market_entity.dart';

import '../widgets/all_btn.dart';
import '../widgets/carusel_slider.dart';
import '../widgets/double_card.dart';
import '../widgets/main_markets_view.dart';
import '/config/system_info/my_size.dart';
import '/domanin/entities/chosen_entity.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/my_route.dart';
import '../../../domanin/entities/discount_entity.dart';
import '../scaffold/my_app_bar.dart';
import '../widgets/card_title.dart';
import '../widgets/chosen_page_view.dart';
import '../widgets/discount/discaunt_view.dart';
import '../widgets/long_card.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});
  final List<CaruselEntity> imgs = [
    CaruselEntity(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU"),
    CaruselEntity(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU"),
    CaruselEntity(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU"),
    CaruselEntity(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU"),
    CaruselEntity(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU"),
  ];

  final double arentir = MySize.arentir;

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
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
            MainMarketsView(
              objs: [
                MainMarketEntity(
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_E4eeQGKiE_bfmItiIM8uUXm3cYFTNQ8Siw&usqp=CAU",
                  num: 23,
                  name: "100haryt.com",
                ),
                MainMarketEntity(
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_E4eeQGKiE_bfmItiIM8uUXm3cYFTNQ8Siw&usqp=CAU",
                  num: 23,
                  name: "Ynamdar",
                ),
                MainMarketEntity(
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_E4eeQGKiE_bfmItiIM8uUXm3cYFTNQ8Siw&usqp=CAU",
                  num: 23,
                  name: "Giper",
                ),
                MainMarketEntity(
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_E4eeQGKiE_bfmItiIM8uUXm3cYFTNQ8Siw&usqp=CAU",
                  num: 23,
                  name: "Balary",
                ),
                MainMarketEntity(
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_E4eeQGKiE_bfmItiIM8uUXm3cYFTNQ8Siw&usqp=CAU",
                  num: 23,
                  name: "Ak yol",
                ),
              ],
            ),
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
              objs: List.generate(
                  100,
                  (index) => DiscountEntity(
                      name: "Name",
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCJgQkIzfThEOELfWHJbRXvDPbuAEIRo8Dog&usqp=CAU",
                      viewNum: 8,
                      date: DateTime.now())),
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
                counter: 65,
                btnFunc: () {},
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr3MuW1xVojkwEii52GvQNrmqFBZpDQqf7Rg&usqp=CAU",
                title: "Konkurs"),
            ChosenPageView(
                allBtnOnTap: () => Navigator.pushNamed(context, Rout.chosen),
                objs: [
                  ChosenEntity(
                      name: "Name",
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-WraasYZRSdEiwoepIVrHwXbcbvHAPvMjEA&usqp=CAU",
                      date: DateTime.now()),
                  ChosenEntity(
                      name: "Ýaryşyň şertleri",
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRML0mJW4BhsZTH-g1ztzLN38grRpKKmRfXx17JrbCUFZm5mw0d45eZetFUNMwzxPKXc0c&usqp=CAU",
                      date: DateTime.now()),
                  ChosenEntity(
                      name: "Name",
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRML0mJW4BhsZTH-g1ztzLN38grRpKKmRfXx17JrbCUFZm5mw0d45eZetFUNMwzxPKXc0c&usqp=CAU",
                      date: DateTime.now()),
                  ChosenEntity(
                      name: "Name",
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRML0mJW4BhsZTH-g1ztzLN38grRpKKmRfXx17JrbCUFZm5mw0d45eZetFUNMwzxPKXc0c&usqp=CAU",
                      date: DateTime.now()),
                  ChosenEntity(
                      name: "Name",
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRML0mJW4BhsZTH-g1ztzLN38grRpKKmRfXx17JrbCUFZm5mw0d45eZetFUNMwzxPKXc0c&usqp=CAU",
                      date: DateTime.now()),
                ]),
            LongCard(
                counter: 65,
                btnFunc: () {},
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr3MuW1xVojkwEii52GvQNrmqFBZpDQqf7Rg&usqp=CAU",
                title: "Top"),
            DoubleCard(
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
        items: imgs.map((e) => e).toList(),
      ),
    );
  }

  Widget buildSliverTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardTitle(counter: 20, title: "Arzanladyşlar"),
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
