import 'package:flutter/material.dart';

import '../../../../config/system_info/my_size.dart';
import '../../scaffold/custom_app_bar.dart';
import '../../scaffold/no_app_bar_scaffold.dart';
import '../../widgets/acaunt_avatar.dart';
import '../../widgets/acaunt_table.dart';
import '../../widgets/indicator_btns.dart';

class PodScreen extends StatelessWidget {
   PodScreen({super.key});
    final double arentir=MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(title: "Hasabym (Pod)"),
        buildContent(),
      ],
    ));
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        AcauntAvatar(
          imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtnaZk2AqKXvnJCHHGwQVriC9rElnP2nEL4g&usqp=CAU",
          name: "Julian Herbs",
          city: "Aşgabat",
          money: 1285,
        ),
                 IndicatorBtns(
          items: [
            IcdicatorItem(text: "Gün"),
            IcdicatorItem(text: "Hepde"),
            IcdicatorItem(text: "Aý"),
          ],
          height: arentir*0.07,
          activeColor: const Color(0xff00C52B),
          indicatorWidth: arentir*0.3,
          indicatorBorder: Border.all(color: const Color(0xffE5E5E5), width: 2),
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: arentir*0.2,
        ), 
        SizedBox(height: arentir*0.07),
           AcauntTable(),
      ]),
    );
  }
}