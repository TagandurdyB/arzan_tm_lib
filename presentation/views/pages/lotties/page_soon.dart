import 'package:lottie/lottie.dart';

import '../../../../config/routes/my_route.dart';
import '../../../../config/vars/constants.dart';
import '../../widgets/btns_group.dart';
import '/config/services/my_size.dart';

import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class PageSoon extends StatelessWidget {
  PageSoon({super.key});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    final bool isFirst = ModalRoute.of(context)!.isFirst;
    return ScaffoldNo(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Words.soon,
            style: TextStyle(fontSize: arentir * 0.07),
            textAlign: TextAlign.center,
          ),
          Container(
            alignment: Alignment.center,
            child: Lottie.asset("assets/coming_soon.json",
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
