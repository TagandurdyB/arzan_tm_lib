import '/config/services/my_size.dart';

import '/presentation/views/scaffold/custom_app_bar.dart';
import 'package:lottie/lottie.dart';

import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  Page404({super.key});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(title: "Error 404"),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Lottie.asset(
              "assets/404.json",
              width: double.infinity,
              height: arentir * 0.9,
              repeat: true,
              reverse: true,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    ));
  }
}
