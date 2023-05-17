// ignore_for_file: must_be_immutable

import '../../pages/chosen/page_chosen_detal.dart';
import '/presentation/providers/data/chosen_data_provider.dart';
import 'package:flutter/material.dart';

import '../../../../config/services/my_size.dart';
import '../../../../config/vars/formater.dart';
import '../../../../domanin/entities/chosens/chosen_entity.dart';
import '../../../providers/view/provider_theme.dart';
import '../shimmer_img.dart';

class ChosenCard extends StatelessWidget {
  final ChosenEntity obj;
  final int index;
  final List<int> idList;
  ChosenCard({
    super.key,
    required this.obj,
    required this.index,
    required this.idList,
  });
  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Visibility(
      visible: !obj.isEmpty,
      child: GestureDetector(
        onTap: () {
          final chosenDP = ChosenDataP.of(context, listen: false);
          chosenDP.changeIndex(index);
          chosenDP.changeChosenIds(idList);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ChosenDetalPage()));
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(arentir * 0.02),
              child: Container(
                //margin: EdgeInsets.all(arentir * 0.01),
                color: ThemeP.of(context).colors.shimmerBg,
                width: arentir * 0.28,
                alignment: Alignment.center,
                child: AspectRatio(
                    aspectRatio: 1 / 1.38,
                    child: ShimmerImg(fit: BoxFit.fill, imageUrl: obj.img)),
              ),
            ),
            buildBottom,
          ],
        ),
      ),
    );
  }

  Container get buildBottom {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(arentir * 0.02)),
        color: Colors.black54,
      ),
      height: arentir * 0.09,
      width: arentir * 0.28,
      padding: EdgeInsets.symmetric(
          vertical: arentir * 0.01, horizontal: arentir * 0.02),
      child: Column(children: [
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              obj.name,
              style: TextStyle(fontSize: arentir * 0.03, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              Formater.calendar(obj.createdAt),
              style: TextStyle(
                  fontSize: arentir * 0.02, color: const Color(0xffC4C4C4)),
            ),
          ),
        ),
      ]),
    );
  }
}
