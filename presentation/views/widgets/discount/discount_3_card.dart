import 'package:flutter/material.dart';

import '../../../../config/system_info/my_size.dart';
import '../../../../config/vars/formater.dart';
import '../../../../domanin/entities/discount_entity.dart';
import '../../../providers/view/provider_theme.dart';
import '../shimmer_img.dart';

class DiscountCardThird extends StatelessWidget {
  final DiscountEntity obj;
  DiscountCardThird({super.key, required this.obj});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: arentir * 0.01),
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(8),
        boxShadow: ThemeP.of(context).shadows.discount,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Theme.of(context).canvasColor,
          child: Column(children: [
            Container(
              color: ThemeP.of(context).colors.shimmerBg,
              height: arentir * 0.22,
              child: ShimmerImg(imageUrl: obj.imageUrl),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(arentir * 0.01),
                color: theme.canvasColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "NOUTBUKLAR AMATLY WE GARAŞARYN",
                      style: TextStyle(fontSize: arentir * 0.027),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Formater.calendar(DateTime.now()),
                          style: TextStyle(
                              fontSize: arentir * 0.023,
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
                              "1035",
                              style: TextStyle(
                                  fontSize: arentir * 0.023,
                                  color: const Color(0xff747474)),
                            )
                          ],
                        )
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
