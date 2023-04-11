import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'custom_navigation_bar.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final double appbarHeight;
  const MyScaffold({
    this.appbarHeight = kToolbarHeight,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(appbarHeight),
          child: const CustomAppBar()),
      bottomNavigationBar: const CustomNavigationBar(),
      body: body,
    );
  }
}
