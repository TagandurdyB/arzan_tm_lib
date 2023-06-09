import 'package:flutter_html/flutter_html.dart';

import '../../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

import '../../../../config/vars/formater.dart';
import '../../../../domanin/entities/discounts/discount_entity.dart';
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
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(horizontal: arentir * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: ThemeP.of(context).shadows.discount,
      ),
      child: Container(
        color: Theme.of(context).canvasColor,
        child: Row(children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                // color: ThemeP.of(context).colors.shimmerBg,
                width: arentir * 0.44,
                height: arentir,
                child: ShimmerImg(fit: BoxFit.fitHeight, imageUrl: obj.img),
              ),
              Visibility(
                visible: obj.mod > 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: arentir * 0.035,
                    backgroundColor: const Color(0xff0EC243),
                    child: Text(
                      "${obj.mod}%",
                      style: TextStyle(
                          fontSize: arentir * 0.025, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(arentir * 0.02),
              color: theme.canvasColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    obj.title,
                    style: TextStyle(fontSize: arentir * 0.034),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(child: Html(data: obj.description)),
                  // Text(
                  //   obj.description,
                  //   style: TextStyle(
                  //       fontSize: arentir * 0.026,
                  //       color: const Color(0xff333333)),
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
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
                            "${obj.viewed}",
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
    );
  }
}
