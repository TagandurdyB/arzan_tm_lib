// ignore_for_file: must_be_immutable

import '../../../../config/routes/my_route.dart';
import '../../../../domanin/entities/coin_tarifs_entity.dart';
import '/presentation/views/widgets/my_container.dart';
import '/presentation/views/widgets/next_btn.dart';

import '../../../../config/services/my_size.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class BuyCionPage extends StatelessWidget {
  BuyCionPage({super.key});

  late BuildContext context;
  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
      body: Column(children: [
        buildTopBar,
        // SettingsContent()
        Padding(
          padding: const EdgeInsets.all(16),
          child: NextBtn(
            func: () {
              Navigator.pushNamed(context, Rout.buyService);
            },
            text: "Hyzmat satyn almak",
          ),
        ),
        Expanded(child: buildContent),
      ]),
    );
  }

  Widget get buildTopBar => Container(
        color: Colors.white54,
        height: kToolbarHeight,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const BackButton(),
            Text(
              "Ball satyn almak",
              style: TextStyle(fontSize: MySize.arentir * 0.065),
            ),
          ],
        ),
      );

  List<TarifsEntity> tarifs = [
    TarifsEntity(img: "assets/coin.png", coin: 10, tmt: 1),
    TarifsEntity(img: "assets/coin30.png", coin: 30, tmt: 2),
    TarifsEntity(img: "assets/coin50.png", coin: 50, tmt: 3),
    TarifsEntity(img: "assets/coin100.png", coin: 100, tmt: 5),
    TarifsEntity(img: "assets/coin500.png", coin: 500, tmt: 20),
  ];

  Widget get buildContent => ListView.separated(
        separatorBuilder: (context, index) =>
            const Divider(color: Color(0xffE5E5E5)),
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) => buildCoin(tarifs[index]),
      );

  Widget buildCoin(TarifsEntity terif) => Container(
        child: ListTile(
          leading: Container(
              padding: const EdgeInsets.all(8),
              width: arentir * 0.15,
              height: arentir * 0.15,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      stops: [0.2, 1],
                      colors: [Color(0xffFFF59E), Colors.white])),
              child: Image.asset(terif.img)),
          title: Text(
            "${terif.coin} ball",
            style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium!.color,
                fontWeight: FontWeight.bold,
                fontSize: arentir * 0.04),
          ),
          trailing: MyContainer(
            onTap: ()=>Navigator.pushNamed(context, Rout.bank),
            shape: arentir * 0.01,
            alignment: Alignment.center,
            color: const Color(0xff0EC243),
            width: arentir * 0.17,
            height: arentir * 0.09,
            child: Text(
              "${terif.tmt} TMT",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
}
