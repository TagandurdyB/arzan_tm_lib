import 'package:lottie/lottie.dart';

import '../../../../config/routes/my_route.dart';
import '../../../../config/vars/constants.dart';
import '../../widgets/btns_group.dart';
import '/config/services/my_size.dart';

import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class Page500 extends StatelessWidget {
  Page500({super.key});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final String lottie = isDark ? "assets/500_dark.json" : "assets/500.json";
    final bool isFirst = ModalRoute.of(context)!.isFirst;
    return ScaffoldNo(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Words.error500,
            style: TextStyle(fontSize: arentir * 0.07),
            textAlign: TextAlign.center,
          ),
          Container(
            alignment: Alignment.center,
            child: Lottie.asset(lottie,
                width: double.infinity, height: arentir * 1, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BorderBtn(
              color: const Color(0xff0EC243),
              text: "Täzeden synanş",
              onTap: () {
                isFirst
                    ? Navigator.pushReplacementNamed(context, Rout.logo)
                    : Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    ));
  }
}
