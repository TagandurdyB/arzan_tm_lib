// ignore_for_file: must_be_immutable

import '/config/vars/constants.dart';
import '/presentation/views/widgets/ReadyInput/ready_input.dart';
import 'package:flutter/material.dart';

import '../scaffold/no_app_bar_scaffold.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
      body: Column(children: [
        buildTopBar,
        Expanded(
            child: ListView(
          children: const [
            SizedBox(height: 40),
          ],
        )),

        //SettingsContent()
      ]),
    );
  }

  Widget get buildTopBar => SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: BackButton(),
            ),
            Expanded(child: Hero(tag: Tags.rIMainSearch, child: buildInput)),
          ],
        ),
      );

  Widget get buildInput {
    final themeColors = Theme.of(context).inputDecorationTheme;
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
      child: Material(
        type: MaterialType.transparency,
        child: ReadyInput(
          cursorColor: Colors.grey,
          inputStyle: themeColors.counterStyle!,
          enabledBorderColor: themeColors.fillColor!,
          focusedBorderColor: themeColors.focusColor!,
          labelColor: const Color(0xffC4C4C4),
          hintColor: const Color(0xffC4C4C4),
          label: "Gözle...",
          hidden: "Gözle...",
          // autoFocus: true,
          reightWidget: const SizedBox(),
          tag: Tags.rIMainSearch,
          shape: true,
          borderRad: 8,
        ),
      ),
    );
  }
}
