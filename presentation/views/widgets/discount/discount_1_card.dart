import '/config/system_info/my_size.dart';
import 'package:flutter/material.dart';

import '../../../../config/vars/formater.dart';
import '../../../../domanin/entities/discount_entity.dart';
import '../../../providers/view/provider_theme.dart';
import '../shimmer_img.dart';

class DiscountCardFirst extends StatelessWidget {
  final DiscountEntity obj;
  DiscountCardFirst({super.key, required this.obj});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: arentir * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: ThemeP.of(context).shadows.discount,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Theme.of(context).canvasColor,
          child: Row(children: [
            Container(
              color: ThemeP.of(context).colors.shimmerBg,
              width: arentir * 0.44,
              child:  ShimmerImg(imageUrl: obj.imageUrl),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(arentir * 0.02),
                color: theme.canvasColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mebel zakaz alyarys islendik gornusde",
                      style: TextStyle(fontSize: arentir * 0.034),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Salam Hormatly Muşderler biz siziñ islegiñize gora Taýyn Natural Mebel..",
                      style: TextStyle(
                          fontSize: arentir * 0.026,
                          color: const Color(0xff333333)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye_outlined,
                              size: arentir * 0.03,
                              color: const Color(0xff747474),
                            ),
                            SizedBox(width: arentir * 0.01),
                            Text(
                              "1035",
                              style: TextStyle(
                                  fontSize: arentir * 0.023,
                                  color: const Color(0xff747474)),
                            )
                          ],
                        ),
                        Text(
                          Formater.calendar(DateTime.now()),
                          style: TextStyle(
                              fontSize: arentir * 0.023,
                              color: const Color(0xff747474)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
