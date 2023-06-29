import 'package:arzan/presentation/providers/data/provider_profile.dart';

import '../../../../domanin/entities/profiles/user_profile_entity.dart';
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
                  child: Image.asset("assets/banners/top_list.jpg")//ShimmerImg(imageUrl: banerImg ?? ""),
                  ),
            )),
        SizedBox(height: arentir * 0.05),
        buildAcaunts(context),
        Visibility(
          visible: !ProfileP.of(context, listen: false).isLast,
          child: const Padding(padding: EdgeInsets.all(16), child: Center(child: CircularProgressIndicator(color:Colors.green)),)),
        SizedBox(height: arentir * 0.2),
      ],
    );
  }

  Widget buildAcaunts(BuildContext context) {
    final profileP=ProfileP.of(context);
    return Column(
        children: List.generate(
      profileP.tops.length,
      (index)  {
        final UserProfileEntity obj=profileP.tops[index];
       return AcauntCard(
          borderColor:
              index < 3 ? const Color(0xffFFB800) : const Color(0xffCDCDCD),
          obj: AcauntEntity(
            id: 0,
            avatarImg:obj.avatarImg??"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTlUpEozQRaeurgGH1vGdC3WAwXNXQH2qkuQ&usqp=CAU",
                //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTlUpEozQRaeurgGH1vGdC3WAwXNXQH2qkuQ&usqp=CAU",
            num: index + 1,
            name: obj.name,
            coin: obj.coin??0,
            isEmpty: false,
          ));},
    ), 
    
    );
  }
}
