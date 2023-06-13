import '../../widgets/shimmer_img.dart';
import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

import '../../../../domanin/entities/profiles/acaunt_entity.dart';
import '../../widgets/acaunt_card.dart';

class TopUsers extends StatelessWidget {
  TopUsers({super.key});

  final banerImg="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNVbtuN_ECO3DzaBcdg-bF53vDuS1_clQodQ&usqp=CAU";

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        SizedBox(height: arentir * 0.2),
      ],
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
