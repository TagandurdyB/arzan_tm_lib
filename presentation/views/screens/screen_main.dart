import 'package:arzan_tm/config/system_info/my_size.dart';
import 'package:arzan_tm/domanin/entities/chosen_entity.dart';
import 'package:flutter/material.dart';

import '../scaffold/my_app_bar.dart';
import '../widgets/chosen_page_view.dart';
import '../widgets/custom_carusel.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyAppBar(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(arentir * 0.05),
            physics: const BouncingScrollPhysics(),
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
              ChosenPageView(objs: [
                ChosenEntity(
                    name: "Name", imageUrl: "imageUrl", date: DateTime.now()),
                ChosenEntity(
                    name: "Name", imageUrl: "imageUrl", date: DateTime.now()),
                ChosenEntity(
                    name: "Name", imageUrl: "imageUrl", date: DateTime.now()),
                ChosenEntity(
                    name: "Name", imageUrl: "imageUrl", date: DateTime.now()),
                ChosenEntity(
                    name: "Name", imageUrl: "imageUrl", date: DateTime.now()),
              ]),
            ],
          ),
        ),
      ],
    );
  }

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
}
