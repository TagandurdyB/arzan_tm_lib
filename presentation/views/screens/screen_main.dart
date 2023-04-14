import 'package:arzan_tm/config/system_info/my_size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/view/provider_navigation.dart';
import '../scaffold/my_app_bar.dart';
import '../widgets/custom_carusel.dart';

final List<String> imgs = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvH1EzNpeLrLdzhgXUYZJPhRTG79SANegPg&usqp=CAU",
];

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         MyAppBar(),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(16),
                child: CustomCarusel(
                  dotColor: Colors.black26,
                  activDotColor: const Color(0xff0EC243),
                  borderRadius: MySize.arentir * 0.02,
                  items: [
                    buildContent(0),
                    buildContent(1),
                    buildContent(2),
                    buildContent(3),
                    buildContent(4),
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                height: 50,
                child: Text(
                    " Page ${ProviderNavigation.of(context).selectScreen}"),
              ),
              Column(
                children: List.generate(
                    100,
                    (index) => Container(
                          margin: const EdgeInsets.all(8),
                          color: Colors.orange,
                          width: double.infinity,
                          height: 50,
                        )),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildContent(int index) {
    return Image.network(
      imgs[index],
      fit: BoxFit.cover,
      loadingBuilder: (context, child, placeholder) {
        if (placeholder == null) return child;
        return Container(color: Colors.grey);
      },
      errorBuilder: (context, obj, stack) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.25),
          highlightColor: Colors.grey.withOpacity(0.6),
          enabled: true,
          direction: ShimmerDirection.ltr,
          period: const Duration(seconds: 1),
          child: Container(color: Colors.grey.withOpacity(0.5)),
        );
      },
    );
  }
}
