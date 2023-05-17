// ignore_for_file: must_be_immutable

import '/config/services/my_size.dart';
import '/domanin/entities/chosens/chosen_entity.dart';
import '/presentation/views/widgets/chosen/chosen_card.dart';

import '/presentation/providers/data/main_page_provider.dart';

import '../../scaffold/custom_app_bar.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class ChosenPage extends StatelessWidget {
  ChosenPage({super.key});

  late BuildContext context;
  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
      body: Column(children: [
        CustomAppBar(title: "Saylananlar"),
        SingleChildScrollView(child: buildContent),
        // SettingsContent()
      ]),
    );
  }

  Widget get buildContent {
    final providM = MainPageP.of(context);
    return Column(
      children: [
        Wrap(
            spacing: arentir * 0.02,
            children: List.generate(providM.entity.saylananlarCount, (index) {
              final obj = providM.entity.saylananlarDatas[index];
              return ChosenCard(
                  obj: obj,
                  index: index,
                  idList: ChosenEntity.idList(providM.entity.saylananlarDatas));
            }))
      ],
    );
  }
}
