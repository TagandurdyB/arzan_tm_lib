// ignore_for_file: must_be_immutable

import '../../../../config/vars/constants.dart';
import '../../../../config/vars/formater.dart';
import '../../../../domanin/entities/bought_entity.dart';
import '../../../providers/data/hive_provider.dart';

import '/presentation/views/widgets/arzan_coin.dart';

import '/presentation/views/widgets/custom_avatar.dart';

import '../../../../config/services/my_size.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class BoughtsPage extends StatefulWidget {
  const BoughtsPage({super.key});

  @override
  State<BoughtsPage> createState() => _BoughtsPageState();
}

class _BoughtsPageState extends State<BoughtsPage> {
  @override
  late BuildContext context;

  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
      body: Column(children: [
        buildTopBar,
        buildUser,
        Expanded(child: buildContent),
      ]),
    );
  }

  List<BoughtServiceEntity> objs = [
    BoughtServiceEntity(
      serviceImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgIcaunOj3K20p2LQXlEh58Zv38qeBb5AVMA&usqp=CAU",
      serviceName: "Albom döretmek",
      locations: ["Aşgabat", "Mary", "Daşoguz"],
      date: "1 aý",
      sum: 1820,
      status: false,
    ),
  ];

  Widget get buildTopBar => Container(
        color: Colors.white54,
        height: kToolbarHeight,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const BackButton(),
            Text(
              "Hyzmat satyn almak",
              style: TextStyle(fontSize: MySize.arentir * 0.065),
            ),
          ],
        ),
      );

  Widget get buildUser => Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CustomAvatar(
              goAcaunt: true,
              radius: arentir * 0.12,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                        visible: HiveP.of(context).readStr(Tags.hiveRole) ==
                            "official",
                        child: buildStar),
                    Text(
                      "100haryt.com",
                      style: TextStyle(fontSize: arentir * 0.04),
                    ),
                  ],
                ),
                Visibility(
                  visible:
                      HiveP.of(context).readStr(Tags.hiveRole) == "official",
                  child: Text(
                    "Gutarýan wagty: ${Formater.calendar(DateTime.now())}",
                    style: TextStyle(
                        color: const Color(0xffAAAAAA),
                        fontSize: arentir * 0.03),
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            Text(
              "1285",
              style: TextStyle(
                  color: const Color(0xffE79E12), fontSize: arentir * 0.04),
            ),
            const SizedBox(width: 5),
            ArzanCoin(radius: arentir * 0.05),
          ],
        ),
      );

  Container get buildStar {
    return Container(
      margin: EdgeInsets.only(right: arentir * 0.01),
      decoration: BoxDecoration(
          color: const Color(0xffB47D3F),
          border: Border.all(color: const Color(0xffE2BD83), width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: const Icon(
        Icons.star,
        color: Color(0xffE2BD83),
        size: 12,
      ),
    );
  }

  Widget get buildContent => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: objs.map((obj) => boughtCard(obj)).toList(),
        ),
      );

  Widget boughtCard(BoughtServiceEntity obj) => Container(
        padding: EdgeInsets.all(arentir * 0.03),
        margin: EdgeInsets.all(arentir * 0.03),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xffDBDBDB)),
            borderRadius: BorderRadius.circular(arentir * 0.03)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            boughtCardLeft(obj),
            Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const Text("Jemi baha:"),
                    Text(
                      "${obj.sum}",
                      style: const TextStyle(color: Color(0xffE79E12)),
                    ),
                    ArzanCoin(radius: arentir * 0.03),
                  ]),
                  Container(
                    padding: EdgeInsets.all(arentir * 0.025),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: const Color(0xff0EC243)),
                        borderRadius: BorderRadius.circular(arentir * 0.01)),
                    child: const Text("Garaşylýar"),
                  ),
                ]),
          ],
        ),
      );

  Column boughtCardLeft(BoughtServiceEntity obj) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: arentir * 0.01),
              width: arentir * 0.05,
              height: arentir * 0.05,
              child: Image.network(obj.serviceImg)),
          Text(obj.serviceName,
              style: TextStyle(
                  fontSize: arentir * 0.04, fontWeight: FontWeight.bold)),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: arentir * 0.01),
        child: buildRowIcon(Icons.location_on_outlined, const Color(0xff438633),
            Formater.locations(obj.locations)),
      ),
      buildRowIcon(Icons.calendar_month, const Color(0xff1661B9), obj.date),
    ]);
  }

  Widget buildRowIcon(IconData iconD, Color col, String text) => Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: arentir * 0.012),
            child: Icon(
              iconD,
              size: arentir * 0.04,
              color: col,
            ),
          ),
          Text(text),
        ],
      );
}
