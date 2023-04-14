import 'package:flutter/material.dart';

class ScaffoldNo extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  const ScaffoldNo({
    required this.body,
    this.bottomNavigationBar,
    this.drawer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(elevation: 0),
      ),
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      body: body,
    );
  }
}
