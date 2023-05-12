import '/presentation/views/widgets/all_btn.dart';

import '../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

import 'arzan_coin.dart';
import 'my_pop_widget.dart';

class AcauntTable extends StatelessWidget {
  AcauntTable({super.key});
  final double arentir = MySize.arentir;

  final List objs = [
    [
      const Color(0xffF4DDE1),
      const Color(0xffE50027),
      Icons.favorite_border,
      "Like",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ],
    [
      const Color(0xffDDEFF6),
      const Color(0xff00B2FF),
      Icons.chat_outlined,
      "Teswir",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ],
    [
      const Color(0xffEADFF3),
      const Color(0xff8519DA),
      Icons.content_paste_outlined,
      "Post",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ],
    [
      const Color(0xffDDDDDD),
      const Color(0xff000000),
      Icons.follow_the_signs,
      "Myhman",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ],
    [
      const Color(0xffDEF0E4),
      const Color(0xff0EC243),
      Icons.group,
      "Yzarlamalar",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ],
    [
      const Color(0xffDDEAE2),
      const Color(0xff008631),
      Icons.group_add_outlined,
      "Çagyrma",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ],
  ];
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
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
      padding: EdgeInsets.symmetric(horizontal: arentir * 0.05),
      child: Row(children: [
        Expanded(
            flex: 3,
            child: Text("Ady",
                style: TextStyle(
                    fontSize: arentir * 0.04, fontWeight: FontWeight.bold))),
        Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: Text("Mukdar",
                    style: TextStyle(
                        fontSize: arentir * 0.04,
                        fontWeight: FontWeight.bold)))),
        Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: Text("Ball",
                    style: TextStyle(
                        fontSize: arentir * 0.04,
                        fontWeight: FontWeight.bold)))),
      ]),
    );
  }

  Widget buildTableElem(int index) => GestureDetector(
        onTap: () =>
            _popExplanation(objs[index][1], objs[index][2], objs[index][4]),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          margin: const EdgeInsets.all(4),
          height: arentir * 0.17,
          decoration: BoxDecoration(
              // color: Colors.red,
              border: Border.all(color: const Color(0xffECECEC), width: 1),
              borderRadius: BorderRadius.circular(arentir * 0.04)),
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
        ),
      );

  void _popExplanation(Color col, IconData iconD, String text) {
    MyPopUpp(
      content: buildPopContent(col, iconD, text),
      borderRadius: 20,
      padding: const EdgeInsets.all(0),
      width: MySize.arentir * 0.7,
      height: MySize.arentir * 0.7,
      // actions: [ActionTeam(text: "ok")],
    ).pop(context);
  }

  Widget buildPopContent(Color col, IconData iconD, String text) {
    return Container(
        // color: Colors.red,
        child: Column(children: [
      Icon(
        iconD,
        color: col,
        size: arentir * 0.1,
      ),
      Container(
        margin: EdgeInsets.all(arentir * 0.02),
        height: arentir * 0.35,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Text(
              text,
              style: TextStyle(fontSize: arentir * 0.05),
              textAlign: TextAlign.center,
            )),
      ),
      AllBtn(
        padding: EdgeInsets.symmetric(
            horizontal: arentir * 0.06, vertical: arentir * 0.015),
        text: "OK",
        bgColor: const Color(0xff00AE26),
        fontSize: arentir * 0.05,
        onTap: () => Navigator.pop(context),
      )
    ]));
  }

  Widget buildIcon(Color bgCol, Color col, IconData iconD, String title) {
    return Row(
      children: [
        Container(
          width: arentir * 0.11,
          height: arentir * 0.11,
          decoration: BoxDecoration(
              color: bgCol, borderRadius: BorderRadius.circular(30)),
          child: Icon(iconD, color: col),
        ),
        SizedBox(width: arentir * 0.03),
        Text(
          title,
          style: TextStyle(fontSize: arentir * 0.04),
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
