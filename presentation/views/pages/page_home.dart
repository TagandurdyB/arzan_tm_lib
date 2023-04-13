import 'package:flutter/material.dart';

import '../scaffold/my_scaffold.dart';
import '../widgets/custom_carusel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appbarHeight: kToolbarHeight + 10,
      //bottomNavigationBar: BottomNavigationBar(),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(16),
        child: CustomCarusel(
          items: [
            buildContent(0),
            buildContent(1),
            buildContent(2),
            buildContent(3),
            buildContent(4),
          ],
        ),
      ),
    );
  }

  Widget buildContent(int index) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Text("$index", style: const TextStyle(fontSize: 60)),
    );
  }
}
