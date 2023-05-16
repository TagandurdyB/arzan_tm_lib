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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScBxK0jJp4352312r-VuTGn6KkeimRr_XUuA&usqp=CAU"))),
        alignment: Alignment.center,
        // color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  regions.length, (index) => buildBtn(regions[index]))),
        ),
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
              // color: Colors.white,
              borderRadius: BorderRadius.circular(arentir * 0.05),
              border: Border.all(color: Colors.white, width: 2),
              // boxShadow: const [
              //   BoxShadow(blurRadius: 7, color: Colors.blue, spreadRadius: -1)
              // ],
              gradient: const LinearGradient(
                  colors: [Color(0xff21652C), Color(0xff62A720)])),
          width: arentir * 0.6,
          height: arentir * 0.15,
          margin: EdgeInsets.all(arentir * 0.02),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: arentir * 0.06),
          )),
    );
  }
}
