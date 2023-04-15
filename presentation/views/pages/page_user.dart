// ignore_for_file: must_be_immutable, avoid_print

import 'package:arzan_tm/presentation/views/scaffold/no_app_bar_scaffold.dart';

import '/config/system_info/my_size.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          buildTopBar,
          const SizedBox(height: 40),
          // SettingsContent()
        ]),
      ),
    );
  }

  Widget get buildTopBar => Row(
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)),
          Text(
            "Sahsy otag",
            style: TextStyle(fontSize: MySize.arentir * 0.065),
          ),
        ],
      );
}
