// ignore_for_file: must_be_immutable

import '../../../config/routes/my_route.dart';
import '../../../config/vars/constants.dart';
import '../../providers/data/hive_provider.dart';
import '/config/services/my_size.dart';

import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class RegionPage extends StatelessWidget {
  RegionPage({super.key});

  List<String> regions = [
    "Türkmenistan",
    "Aşgabat",
    "Balkan",
    "Mary",
    "Lebap",
    "Ahal",
    "Daşoguz"
  ];

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
      bgColor: const Color(0xff20992C),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Welayat saylaň",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: arentir * 0.06),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Image.asset("assets/Karta.png"),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  regions.length, (index) => buildBtn(regions[index]))),
                  const SizedBox(height: 70)
        ],
      ),
    );
  }

  Widget buildBtn(String text) {
    return GestureDetector(
      onTap: () {
        HiveP.of(context, listen: false).saveStr(text, Tags.hiveWelayat);
        Navigator.pushNamedAndRemoveUntil(
            context, Rout.home, (route) => route.isFirst);
      },
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(arentir * 0.02),
            border: Border.all(color: Colors.black, width: 2),
            // boxShadow: const [
            //   BoxShadow(blurRadius: 7, color: Colors.blue, spreadRadius: -1)
            // ],
            // gradient: const LinearGradient(
            //     colors: [Color(0xff21652C), Color(0xff62A720)]),
          ),
          width: arentir * 0.7,
          height: arentir * 0.15,
          margin: EdgeInsets.all(arentir * 0.02),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                color: const Color(0xff20992C),
                fontWeight: FontWeight.bold,
                fontSize: arentir * 0.06),
          )),
    );
  }
}