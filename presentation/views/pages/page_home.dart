import 'package:flutter/material.dart';

import '../scaffold/my_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appbarHeight: kToolbarHeight + 10,
      //bottomNavigationBar: BottomNavigationBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: const Text("Megen Napyon!!"),
      ),
    );
  }
}
