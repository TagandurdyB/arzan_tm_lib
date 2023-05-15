import '/presentation/views/scaffold/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../scaffold/no_app_bar_scaffold.dart';

class DiscountsPage extends StatelessWidget {
  const DiscountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
      body: Column(children: [
        CustomAppBar(title: "Arzanladyşlar"),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: buildContent,
        ))
      ]),
    );
  }

  Widget get buildContent {
    return Column(children: const [
      
    ],);
  }
}
