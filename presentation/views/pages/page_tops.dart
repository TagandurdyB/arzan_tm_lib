// ignore_for_file: must_be_immutable

import '/presentation/views/screens/tpos/screen_officials.dart';
import '/presentation/views/screens/tpos/screen_users.dart';

import '../widgets/sort_sheed.dart';

import '../../../config/services/my_size.dart';
import '/presentation/views/widgets/indicator_btns.dart';
import 'package:flutter/material.dart';

import '../scaffold/custom_app_bar.dart';
import '../scaffold/no_app_bar_scaffold.dart';

class TopsPage extends StatefulWidget {
  const TopsPage({super.key});

  @override
  State<TopsPage> createState() => _TopsPageState();
}

class _TopsPageState extends State<TopsPage> {
  // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNVbtuN_ECO3DzaBcdg-bF53vDuS1_clQodQ&usqp=CAU",
  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(
          title: "Top hasaplar",
          actions: [
            IconButton(onPressed: _showSortSheed, icon: const Icon(Icons.sort))
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(), child: buildContent)),
      ],
    ));
  }

  void _showSortSheed() {
    showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Column(
              children: [
                // SafeArea(child: CustomAppBar(title: "Top hasaplar")),
                const Expanded(child: SizedBox()),
                Container(
                  // height: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(arentir * 0.03))),
                  child: SortSheed(),
                ),
              ],
            ));
  }

  final List _screens = [TopUsers(), TopOfficials()];
  int _screenIndex = 0;

  Widget get buildContent {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          IndicatorBtns(
            indicatorWidth: arentir * 0.46,
            indicatorBorder:
                Border.all(color: const Color(0xffE5E5E5), width: 1),
            borderRadius: 8,
            dynamicBorder: true,
            height: arentir * 0.1,
            activeColor: const Color(0xff00C52B),
            items: [
              IndicatorItem(text: "Ulanyjylar"),
              IndicatorItem(text: "Resmiler"),
            ],
            onChange: (index) => setState(() => _screenIndex = index),
          ),
          _screens[_screenIndex],
          // SizedBox(height: arentir * 0.05),
          // AcauntCard(
          //     borderColor: const Color(0xff00C52B),
          //     obj: AcauntEntity(
          //       id: 1,
          //       avatarImg:
          //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTlUpEozQRaeurgGH1vGdC3WAwXNXQH2qkuQ&usqp=CAU",
          //       num: 34,
          //       name: "Leo",
          //       coin: 465,
          //       isEmpty: false,
          //     )),
        ],
      ),
    );
  }
}
