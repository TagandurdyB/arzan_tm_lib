// ignore_for_file: must_be_immutable

import '../../../domanin/entities/value_entity.dart';

import '/presentation/providers/data/values_provider.dart';

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
    final valueP = ValuesP.of(context);
    return ScaffoldNo(
      bgColor: const Color(0xff20992C),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
        
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Image.asset("assets/Karta.png"),
          ),
            Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Sebitiňizi saýlaň",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: arentir * 0.045),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: valueP.locations.map((e) {
              return buildBtn(e);
            }).toList(),
            // children: List.generate(
            //     regions.length, (index) => buildBtn(regions[index])),
          ),
          const SizedBox(height: 70)
        ],
      ),
    );
  }

  Widget buildBtn(ValueEntity obj) {
    bool isSelected=HiveP.of(context).readInt(Tags.hiveLocationId) == obj.id;
    return GestureDetector(
      onTap: () {
        final hiveP = HiveP.of(context, listen: false);
        hiveP.saveStr(obj.name, Tags.hiveLocation);
        hiveP.saveInt(obj.id, Tags.hiveLocationId);
        Navigator.pushNamedAndRemoveUntil(
            context, Rout.home, (route) => route.isFirst);
      },
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xff20992C)
                : Colors.white,
            borderRadius: BorderRadius.circular(arentir * 0.1),
            // border: isSelected?Border.all(color: Colors.white, width: 2):null,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 7, color: Colors.black, spreadRadius: -1)
            ],
            // gradient: const LinearGradient(
            //     colors: [Color(0xff21652C), Color(0xff62A720)]),
          ),
          width: arentir * 0.6,
          height: arentir * 0.12,
          margin: EdgeInsets.all(arentir * 0.02),
          alignment: Alignment.center,
          child: Text(
            obj.name,
            style: TextStyle(
                color:isSelected?Colors.white: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: arentir * 0.05),
          )),
    );
  }
}
