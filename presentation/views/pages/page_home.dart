import 'package:flutter/material.dart';
import '../screens/home_screens.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeScreens());
  }
}
