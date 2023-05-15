import '../../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

import '../../../../config/vars/formater.dart';
import '../../../../domanin/entities/discount_detal_entity.dart';
import '../../../../domanin/entities/main_page/discount_entity.dart';
import '../../../providers/view/provider_theme.dart';
import '../../pages/page_discount_detal.dart';
import '../shimmer_img.dart';

class DiscountCardFirst extends StatelessWidget {
  final DiscountEntity obj;
  DiscountCardFirst({super.key, required this.obj});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
            onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DiscountDetal(
                      obj: 
                        DiscountDetalEntity(
                          userImg:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_E4eeQGKiE_bfmItiIM8uUXm3cYFTNQ8Siw&usqp=CAU",
                          userName: "100haryt",
                          pictures: [
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCJgQkIzfThEOELfWHJbRXvDPbuAEIRo8Dog&usqp=CAU"
                          ],
                          id: 1,
                          createdAt: DateTime.now(),
                          viewed: 14756,
                          liked: 5693,
                          chated: 216,
                          title: "Realme C33 Smartfon 4/128 GB, altyn reňk",
                          oldPrice: 9000,
                          newPrice: 6930,
                          startedAt: DateTime.now(),
                          endedAt: DateTime.now(),
                          about:
                              "Dinamiki surata düşüriň we ulanyjy interfeýsiňizi indiki derejä çykarmak üçin oýlanyşykly döredilen C33 realme bilen suwuk wizuallardan lezzet alyň. Bu telefon, AI bilen dolandyrylýan 50 MP kamerany görkezýär, bu düşnüksiz suratlary aýdyňlyk bilen ajaýyp düşürmäge mümkinçilik berýär. Mundan başga-da, bu smartfona 5000 mAh uly batareýa goşulyp, üznüksiz öndürijilikden lezzet alyp bilersiňiz we işdäki öndürijiligiňizi ýokarlandyryp bilersiňiz. Mundan başga-da, ajaýyp “Unisoc T612” prosessor bilen işleýän, ajaýyp iş tejribesinden lezzet alyp bilersiňiz. Mundan başga-da, C33 meýdanynyň giňligi 16.5 sm (6.5) paneliň kömegi bilen wizual tejribäňizi ýokary derejä çykaryp bilersiňiz.",
                          tags: ["realme", "phone"],
                          phone: "+99365168618",
                        )
                      ,
                    )));
      },
      child: Container(
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
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    color: ThemeP.of(context).colors.shimmerBg,
                    width: arentir * 0.44,
                    height: arentir,
                    child: ShimmerImg(fit: BoxFit.fitHeight, imageUrl: obj.img),
                  ),
                  Padding(
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
                ],
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
      ),
    );
  }
}
