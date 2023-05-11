// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../config/services/my_size.dart';

class ScreenUser extends StatelessWidget {
  ScreenUser({super.key});

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildTopBar,
      const SizedBox(height: 40),
      // SettingsContent()
    ]);
  }

  Widget get buildTopBar => Container(
        color: Colors.white54,
        height: kToolbarHeight,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              "Sahsy otag",
              style: TextStyle(fontSize: MySize.arentir * 0.065),
            ),
          ],
        ),
      );
}
