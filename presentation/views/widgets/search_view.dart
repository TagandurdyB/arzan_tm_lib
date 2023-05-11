// ignore_for_file: must_be_immutable

import '../../../config/vars/formater.dart';
import '/domanin/entities/search_entity.dart';

import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

import '../../../config/services/my_size.dart';
import '../../providers/view/provider_navigation.dart';
import '../../providers/view/provider_theme.dart';

class SearchView extends StatelessWidget {
  final List<SearchEntity> objs;
  SearchView({required this.objs, super.key});

  late BuildContext context;
  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Visibility(
      visible: ProviderNav.of(context).isSaved,
      child: Column(children: [
        buildTitle,
        Expanded(
            child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: arentir * 0.04),
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: arentir * 0.03,
              children: objs.map((obj) => buildCard(obj)).toList(),
              // children: List.generate(20, (index) => buildCard(index)),
            ),
          ],
        )),

        //SettingsContent()
      ]),
    );
  }

  Widget get buildTitle {
    return Padding(
      padding: EdgeInsets.all(arentir * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Ady boýunça",
            style: TextStyle(color: Color(0xff00C52B)),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xff00C52B),
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: const Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(SearchEntity obj) {
    return SizedBox(
      // color: Colors.red,
      width: arentir * 0.44,
      height: arentir * 0.46,
      child: Column(children: [
        Container(
          color: ThemeP.of(context).colors.shimmerBg,
          height: arentir * 0.28,
          child: ShimmerImg(imageUrl: obj.imageUrl),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  obj.title,
                  style: TextStyle(fontSize: arentir * 0.032),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Formater.calendar(obj.created),
                      style: TextStyle(
                          fontSize: arentir * 0.025,
                          color: const Color(0xff747474)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          size: arentir * 0.03,
                          color: const Color(0xff747474),
                        ),
                        SizedBox(width: arentir * 0.01),
                        Text(
                          "${obj.viewed}",
                          style: TextStyle(
                              fontSize: arentir * 0.025,
                              color: const Color(0xff747474)),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
