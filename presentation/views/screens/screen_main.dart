import 'package:flutter/material.dart';

import '../../providers/view/provider_navigation.dart';
import '../scaffold/my_scaffold.dart';
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
    return MyScaffold(
       appbarHeight: kToolbarHeight + 10,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(16),
            child: CustomCarusel(
              dotColor: Colors.black26,
              activDotColor: const Color(0xff0EC243),
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
              height: 50,child: Text(" Page ${ProviderNavigation.of(context).selectScreen}"),)
       ],
      ),
    );
  }

  Widget buildContent(int index) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: NetworkImage(imgs[index])),
      ),
      //child: Text("$index", style: const TextStyle(fontSize: 60)),
    );
  }
}
