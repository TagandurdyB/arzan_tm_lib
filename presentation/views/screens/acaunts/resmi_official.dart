import 'package:flutter/material.dart';

import '../../../../config/services/my_size.dart';
import '../../scaffold/custom_app_bar.dart';
import '../../scaffold/no_app_bar_scaffold.dart';
import '../../widgets/acaunt_avatar.dart';
import '../../widgets/acaunt_table.dart';
import '../../widgets/indicator_btns.dart';

class ResmiOfficialScreen extends StatelessWidget {
  ResmiOfficialScreen({super.key});
  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(title: "Hasabym (Resmi official)"),
        Expanded(child:buildContent()),
      ],
    ));
  }

  Widget buildContent() {
    return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        AcauntAvatar(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOo3JKZQ0igLBc1Kg1K_3SSIZGaZZRdKk6Fg&usqp=CAU",
          name: "Resmi Offlicial",
          city: "Aşgabat",
          money: 1285,
        ),
        IndicatorBtns(
          items: [
            IndicatorItem(text: "Gün"),
            IndicatorItem(text: "Hepde"),
            IndicatorItem(text: "Aý"),
          ],
          height: arentir * 0.07,
          activeColor: const Color(0xff00C52B),
          indicatorWidth: arentir * 0.3,
          indicatorBorder: Border.all(color: const Color(0xffE5E5E5), width: 2),
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: arentir * 0.2,
        ), 
        SizedBox(height: arentir*0.07),
           AcauntTable(),
          SizedBox(height: arentir * 0.1),

      ]),
    );
  }
}
