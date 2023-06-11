// ignore_for_file: must_be_immutable

import '/domanin/entities/official_entity.dart';

import '/presentation/views/widgets/official/official_view.dart';

import '../../../config/vars/constants.dart';
import '../widgets/ReadyInput/search_input.dart';
import '../widgets/widget_btn.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../config/services/my_size.dart';

class OfficialsPage extends StatelessWidget {
  OfficialsPage({super.key});

  late BuildContext context;
  final double arentir = MySize.arentir;
  // final FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
      bgColor: const Color(0xffF9FAFC),
      body: Container(
        // color: Colors.black12,
        child: Column(children: [
          buildTopBar,
          SizedBox(height: arentir * 0.03),
          Expanded(child: buildContent),
          // SettingsContent()
        ]),
      ),
    );
  }

  Widget get buildTopBar => Container(
        color: Theme.of(context).appBarTheme.backgroundColor,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                const BackButton(),
                Text(
                  "Resmiler",
                  style: TextStyle(fontSize: MySize.arentir * 0.065),
                ),
              ],
            ),
            buildBarWidgets,
          ],
        ),
      );

  Widget get buildBarWidgets => Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort_sharp)),
          Expanded(child: buildInput),
          const WidgetBtn(),
        ],
      );

  Widget get buildInput {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 16),
      child: SearchInput(
        // focus: focus,
        tag: Tags.rIOfficialSearch,
        hidden: "Gözle...",
        onTap: () {
          // final providN = ProviderNav.of(context, listen: false);
          // providN.changeSearch(true);
          // providN.changeSearchBg(
          //     ThemeP.of(context, listen: false).colors.searchCanvas);
          // providN.changeSaved(false);
        },
        onEditingComplete: () {
          // if (focus.hasFocus) focus.unfocus();
          // final providN = ProviderNav.of(context, listen: false);
          // providN.changeSearchBg(Theme.of(context).canvasColor);
          // providN.changeSaved(true);
        },
      ),
    );
  }

  final List<OfficialEntity> objs = [
    OfficialEntity(
      id: 1,
      avatarImg:
          "https://play-lh.googleusercontent.com/326hZ9pubFetmymUcBe3ZX0gTG_DLdjiDdkleC04Gft-YtiJrBzGrQPNJGqghy6Nfg=w240-h480-rw",
      followers: 2150,
      name: "100haryt.com",
    ),
    OfficialEntity(
      id: 2,
      avatarImg:
          "https://play-lh.googleusercontent.com/326hZ9pubFetmymUcBe3ZX0gTG_DLdjiDdkleC04Gft-YtiJrBzGrQPNJGqghy6Nfg=w240-h480-rw",
      followers: 2150,
      name: "Ynamdar",
    ),
    OfficialEntity(
      id: 3,
      avatarImg:
          "https://play-lh.googleusercontent.com/326hZ9pubFetmymUcBe3ZX0gTG_DLdjiDdkleC04Gft-YtiJrBzGrQPNJGqghy6Nfg=w240-h480-rw",
      followers: 2150,
      name: "100haryt.com",
    ),
  ];

  Widget get buildContent {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      // SliverPadding(padding: const EdgeInsets.all(10), sliver: buildBanner),
      SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: arentir * 0.02),
          sliver: OfficialView(
            // objs: providDD.discounts,
            objs: objs,
          ))
    ]);
  }
}
