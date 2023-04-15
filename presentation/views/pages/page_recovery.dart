// ignore_for_file: must_be_immutable, avoid_print

import 'package:arzan_tm/config/vars/constants.dart';
import 'package:arzan_tm/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:arzan_tm/presentation/views/widgets/ReadyInput/login_arzan_input.dart';
import 'package:arzan_tm/presentation/views/widgets/my_container.dart';
import '../screens/recovery_screens.dart';
import '/config/system_info/my_size.dart';
import 'package:flutter/material.dart';

class RecoveryPage extends StatelessWidget {
  RecoveryPage({super.key});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
      body: Column(children: [
        buildTopBar,
        // const SizedBox(height: 40),
        // SettingsContent()
        const Expanded(
            child:
                Padding(padding: EdgeInsets.all(16), child: RecoveryScreens())),
      ]),
    );
  }

  Widget get buildTopBar => SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            InkWell(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.arrow_back),
                )),
            Text(
              "Açar sözi dikeltmek",
              style: TextStyle(
                  fontSize: MySize.arentir * 0.05, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
