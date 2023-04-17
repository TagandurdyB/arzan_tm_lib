// ignore_for_file: must_be_immutable

import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../config/system_info/my_size.dart';

class RecoveryScaffold extends StatelessWidget {
  final String text;
  final Widget content;
  final String? title;
  RecoveryScaffold(
      {this.title, required this.content, this.text = "", super.key});
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
      body: Column(children: [
        buildTopBar,
        // const SizedBox(height: 40),
        // SettingsContent()
        Expanded(
            child: Padding(
                padding: const EdgeInsets.all(16), child: buildContent)),
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
              title ?? "Açar sözi dikeltmek",
              style: TextStyle(
                  fontSize: MySize.arentir * 0.05, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );

  Widget get buildContent {
    final double arentir = MySize.arentir;
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style:
                  TextStyle(fontSize: arentir * 0.04, height: arentir * 0.004),
            )),
        const SizedBox(height: 20),
        content,
      ],
    );
  }
}
