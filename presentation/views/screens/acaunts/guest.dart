import '../../../../config/services/my_size.dart';
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        AcauntAvatar(
          name: "Myhman",
          // city: "Aşgabat",
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
        SizedBox(height: arentir * 0.07),
        AcauntTable(
          objs: const [
            [
              Color(0xffF4DDE1),
              Color(0xffE50027),
              Icons.favorite_border,
              "Like",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            ],
            // [
            //   const Color(0xffDDEFF6),
            //   const Color(0xff00B2FF),
            //   Icons.chat_outlined,
            //   "Teswir",
            //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            // ],
            [
              Color(0xffEADFF3),
              Color(0xff8519DA),
              Icons.content_paste_outlined,
              "Post",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            ],
            // [
            //   const Color(0xffDDDDDD),
            //   const Color(0xFF1F1B1B),
            //   Icons.follow_the_signs,
            //   "Myhman",
            //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            // ],
            [
              Color(0xffDEF0E4),
              Color(0xff0EC243),
              Icons.group,
              "Yzarlamalar",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            ],
            [
              Color(0xffDDEAE2),
              Color(0xff008631),
              Icons.group_add_outlined,
              "Çagyrma",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            ],
          ],
        ),
        SizedBox(height: arentir * 0.1),
      ]),
    );
  }
}
