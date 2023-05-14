import 'package:flutter/material.dart';

import '../scaffold/custom_app_bar.dart';
import '../scaffold/no_app_bar_scaffold.dart';

class LegalInfoPage extends StatelessWidget {
  const LegalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
      body: Column(children: [
        CustomAppBar(title: "Düzgünler"),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: buildContent,
        ))
      ]),
    );
  }

  Widget get buildContent {
    return Column(
      children: const [],
    );
  }
}
