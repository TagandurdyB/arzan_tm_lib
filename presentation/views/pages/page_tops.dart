// ignore_for_file: must_be_immutable

import '../widgets/sort_sheed.dart';
import '/presentation/views/widgets/shimmer_img.dart';

import '../../../config/services/my_size.dart';
import '/domanin/entities/acaunt_entity.dart';
import '/presentation/views/widgets/indicator_btns.dart';
import 'package:flutter/material.dart';

import '../scaffold/custom_app_bar.dart';
import '../scaffold/no_app_bar_scaffold.dart';
import '../widgets/acaunt_card.dart';

class TopsPage extends StatelessWidget {
  final String? banerImg;
  TopsPage({
    this.banerImg =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNVbtuN_ECO3DzaBcdg-bF53vDuS1_clQodQ&usqp=CAU",
    super.key,
  });

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(
          title: "Top hasaplar",
          actions: [
            IconButton(
                onPressed: _showSortSheed,
                icon: const Icon(Icons.sort, color: Colors.white))
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
                  child:  SortSheed(),
                ),
              ],
            ));
  }

  Widget get buildContent {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          IndicatorBtns(
            indicatorWidth: arentir * 0.46,
            indicatorBorder:
                Border.all(color: const Color(0xffE5E5E5), width: 1),
            borderRadius: 34,
            dynamicBorder: true,
            height: arentir * 0.1,
            activeColor: const Color(0xff00C52B),
            items: [
              IndicatorItem(text: "Ulanyjylar"),
              IndicatorItem(text: "Resmiler"),
            ],
          ),
          SizedBox(height: arentir * 0.05),
          AcauntCard(
              borderColor: const Color(0xff00C52B),
              obj: AcauntEntity(
                id: 1,
                avatarImg:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTlUpEozQRaeurgGH1vGdC3WAwXNXQH2qkuQ&usqp=CAU",
                num: 34,
                name: "Leo",
                coin: 465,
                isEmpty: false,
              )),
          SizedBox(height: arentir * 0.05),
          ClipRRect(
              borderRadius: BorderRadius.circular(arentir * 0.02),
              child: SizedBox(
                // color: Colors.red,
                width: MySize.width * 0.9,
                height: MySize.width * 0.51,
                child: Visibility(
                    visible: banerImg != null,
                    child: ShimmerImg(imageUrl: banerImg ?? "")),
              )),
          SizedBox(height: arentir * 0.05),
          buildAcaunts(),
          SizedBox(height: arentir*0.2),
        ],
      ),
    );
  }

  Widget buildAcaunts() {
    return Column(
        children: List.generate(
      10,
      (index) => AcauntCard(
          borderColor:
              index < 3 ? const Color(0xffFFB800) : const Color(0xffCDCDCD),
          obj: AcauntEntity(
            id: 1,
            avatarImg:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTlUpEozQRaeurgGH1vGdC3WAwXNXQH2qkuQ&usqp=CAU",
            num: index + 1,
            name: "Leo",
            coin: 465,
            isEmpty: false,
          )),
    ));
  }
}
