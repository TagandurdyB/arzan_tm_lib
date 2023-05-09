import '/config/system_info/my_size.dart';
import 'package:flutter/material.dart';

import '../../scaffold/custom_app_bar.dart';
import '../../scaffold/no_app_bar_scaffold.dart';
import '../../widgets/acaunt_avatar.dart';
import '../../widgets/acaunt_table.dart';
import '../../widgets/indicator_btns.dart';

class GuestScreen extends StatelessWidget {
  GuestScreen({super.key});
  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(title: "Hasabym (Myhman)"),
        Expanded(child: buildContent()),
      ],
    ));
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          AcauntAvatar(
            name: "Myhman",
            // city: "Aşgabat",
            money: 1285,
          ),
          IndicatorBtns(
            items: [
              IcdicatorItem(text: "Gün"),
              IcdicatorItem(text: "Hepde"),
              IcdicatorItem(text: "Aý"),
            ],
            height: arentir * 0.07,
            activeColor: const Color(0xff00C52B),
            indicatorWidth: arentir * 0.3,
            indicatorBorder:
                Border.all(color: const Color(0xffE5E5E5), width: 2),
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: arentir * 0.2,
          ),
          SizedBox(height: arentir * 0.07),
          AcauntTable(),
          SizedBox(height: arentir * 0.1),
        ]),
      ),
    );
  }
}
