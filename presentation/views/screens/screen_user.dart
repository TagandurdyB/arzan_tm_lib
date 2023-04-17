// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../config/system_info/my_size.dart';

class ScreenUser extends StatelessWidget {
  ScreenUser({super.key});

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        buildTopBar,
        const SizedBox(height: 40),
        // SettingsContent()
      ]),
    );
  }

  Widget get buildTopBar => Row(
        children: [
          Text(
            "Sahsy otag",
            style: TextStyle(fontSize: MySize.arentir * 0.065),
          ),
        ],
      );
}
