import 'package:flutter/material.dart';

import '../scaffold/custom_app_bar.dart';
import '../scaffold/no_app_bar_scaffold.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(title: "Wideo"),
        Expanded(child: buildContent),
      ],
    ));
  }

  Widget get buildContent {
    return Container(
      color: Colors.red,
    );
  }
}