import 'package:arzan/config/system_info/my_size.dart';
import 'package:flutter/material.dart';

import 'arzan_coin.dart';

class AcauntTable extends StatelessWidget {
  AcauntTable({super.key});
  final double arentir = MySize.arentir;

  final List objs = [
    [
      const Color(0xffF4DDE1),
      const Color(0xffE50027),
      Icons.favorite_border,
      "Like"
    ],
    [
      const Color(0xffDDEFF6),
      const Color(0xff00B2FF),
      Icons.chat_outlined,
      "Teswir"
    ],
    [
      const Color(0xffEADFF3),
      const Color(0xff8519DA),
      Icons.content_paste_outlined,
      "Post"
    ],
    [
      const Color(0xffDDDDDD),
      const Color(0xff000000),
      Icons.follow_the_signs,
      "Myhman"
    ],
    [
      const Color(0xffDEF0E4),
      const Color(0xff0EC243),
      Icons.group,
      "Yzarlamalar"
    ],
    [
      const Color(0xffDDEAE2),
      const Color(0xff008631),
      Icons.group_add_outlined,
      "Çagyrma"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return buildTable();
  }

  Widget buildTable() {
    return Column(
        children: List.generate(7, (index) {
      if (index == 0) {
        return buildTitle;
      } else {
        return buildTableElem(index - 1);
      }
    }));
  }

  Widget get buildTitle {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: arentir * 0.07),
      child: Row(children: [
        Expanded(
            flex: 3,
            child: Text("Ady", style: TextStyle(fontSize: arentir * 0.04))),
        Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: Text("Mukdar",
                    style: TextStyle(fontSize: arentir * 0.04)))),
        Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child:
                    Text("Ball", style: TextStyle(fontSize: arentir * 0.04)))),
      ]),
    );
  }

  Widget buildTableElem(int index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.all(4),
        height: arentir * 0.2,
        decoration: BoxDecoration(
            // color: Colors.red,
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: buildIcon(
                  objs[index][0],
                  objs[index][1],
                  objs[index][2],
                  objs[index][3],
                )),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 40,
              child: const Text("123"),
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("345", style: TextStyle(color: Color(0xffE79E12))),
                SizedBox(width: arentir * 0.02),
                const ArzanCoin(radius: 15),
              ],
            )),
          ],
        ),
      );

  Widget buildIcon(Color bgCol, Color col, IconData iconD, String title) {
    return Row(
      children: [
        Container(
          width: arentir * 0.13,
          height: arentir * 0.13,
          decoration: BoxDecoration(
              color: bgCol, borderRadius: BorderRadius.circular(30)),
          child: Icon(iconD, color: col),
        ),
        SizedBox(width: arentir * 0.03),
        Text(
          title,
          style: TextStyle(fontSize: arentir * 0.045),
        )
      ],
    );
  }

  Table buildTable1() {
    return Table(
        children: List.generate(
            100,
            (index) => TableRow(
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: const Text("Ady")),
                      Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: const Text("Ady")),
                      Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: const Text("Ady")),
                      Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: const Text("Ady")),
                    ])));
  }
}
