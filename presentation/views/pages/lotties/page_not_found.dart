import '/config/services/my_size.dart';
import 'package:lottie/lottie.dart';

import '../../scaffold/custom_app_bar.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  PageNotFound({super.key});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(title: "PAGE NOT FOUND"),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Lottie.asset("assets/pageNotFound.json",
                width: double.infinity, height: arentir * 1, fit: BoxFit.fill),
          ),
        ),
      ],
    ));
  }
}
