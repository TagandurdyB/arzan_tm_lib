import '/domanin/entities/main_page/discount_entity.dart';

import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

import '../../../../config/services/my_size.dart';
import '../../../../config/vars/formater.dart';
import '../../../providers/view/provider_theme.dart';

class DiscountCardSecond extends StatelessWidget {
  final DiscountEntity obj;
  DiscountCardSecond({super.key, required this.obj});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: arentir * 0.02),
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
              height: arentir * 0.29,
              child: ShimmerImg(imageUrl: obj.img, fit: BoxFit.fill),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(arentir * 0.02),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        obj.title,
                        style: TextStyle(fontSize: arentir * 0.035),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Formater.calendar(obj.createdAt),
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
                              "${obj.viewed}",
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
