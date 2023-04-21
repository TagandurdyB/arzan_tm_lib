import 'package:arzan_tm/config/system_info/my_size.dart';
import 'package:arzan_tm/domanin/entities/chosen_entity.dart';
import 'package:arzan_tm/presentation/providers/view/provider_discaunts.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/my_route.dart';
import '../../../domanin/entities/discount_entity.dart';
import '../scaffold/my_app_bar.dart';
import '../widgets/card_title.dart';
import '../widgets/chosen_page_view.dart';
import '../widgets/custom_carusel.dart';
import '../widgets/discount/discaunt_view.dart';
import '../widgets/long_card.dart';
import '../widgets/shimmer_img.dart';

final List<String> imgs = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU",
];

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  final double arentir = MySize.arentir;

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Column(
      children: [
        MyAppBar(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  buildSliverList(context),
                ])),
                SliverAppBar(
                  pinned: true,
                  leading: const SizedBox(),
                  flexibleSpace:
                      FlexibleSpaceBar(background: buildSliverTitle()),
                ),
                DiscountView(
                  objs: List.generate(
                      100,
                      (index) => DiscountEntity(
                          name: "Name",
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5jPfvb627CFjjKL-ohJyJxHmRfMC61F9vX-OLR9SiwcXwuO_AjKRbofEP8cZkeE2qDNU&usqp=CAU",
                          viewNum: 8,
                          date: DateTime.now())),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column buildSliverList(BuildContext context) => Column(
        children: [
          buildSlider,
          LongCard(
              counter: 4,
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr3MuW1xVojkwEii52GvQNrmqFBZpDQqf7Rg&usqp=CAU",
              title: "Top hasaplar"),
          LongCard(
              counter: 12,
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr3MuW1xVojkwEii52GvQNrmqFBZpDQqf7Rg&usqp=CAU",
              title: "Galareýa"),
          ChosenPageView(
              allBtnOnTap: () => Navigator.pushNamed(context, Rout.chosen),
              objs: [
                ChosenEntity(
                    name: "Name",
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-WraasYZRSdEiwoepIVrHwXbcbvHAPvMjEA&usqp=CAU",
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
                ChosenEntity(
                    name: "Name",
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRML0mJW4BhsZTH-g1ztzLN38grRpKKmRfXx17JrbCUFZm5mw0d45eZetFUNMwzxPKXc0c&usqp=CAU",
                    date: DateTime.now()),
              ]),
        ],
      );

  Align get buildSlider {
    return Align(
      alignment: Alignment.topCenter,
      child: CustomCarusel(
        dotColor: Colors.black26,
        activDotColor: const Color(0xff0EC243),
        borderRadius: MySize.arentir * 0.02,
        items: List.generate(
            imgs.length, (index) => ShimmerImg(imageUrl: imgs[index])),
      ),
    );
  }

  Row buildSliverTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardTitle(counter: 20, title: "Arzanladyşlar"),
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  DiscountProvid.of(context, listen: false).tongleColumn;
                },
                child: Icon(
                    buildColumnIcon(DiscountProvid.of(context).cloumnCount))),
            TextButton(
                onPressed: () {},
                child: const Text("Hemmesi",
                    style: TextStyle(color: Colors.green))),
          ],
        )
      ],
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
