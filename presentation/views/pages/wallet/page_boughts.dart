// ignore_for_file: must_be_immutable

import '../../../../config/vars/constants.dart';
import '../../../../config/vars/formater.dart';
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
        // Expanded(child: buildContent),
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
}
