import 'package:lottie/lottie.dart';

import '../../../../config/routes/my_route.dart';
import '../../scaffold/custom_app_bar.dart';
import '/config/services/my_size.dart';

import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class PageDisconnect extends StatelessWidget {
  PageDisconnect({super.key});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    final bool isFirst = ModalRoute.of(context)!.isFirst;
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(
            leading: BackButton(onPressed: () {
              isFirst
                  ? Navigator.pushReplacementNamed(context, Rout.logo)
                  : Navigator.pop(context);
            }),
            title: "Internede çatyl"),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Lottie.asset("assets/disconnect.json",
                width: double.infinity, height: arentir * 1, fit: BoxFit.fill),
          ),
        ),
      ],
    ));
  }
}
