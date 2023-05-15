import 'package:arzan_tm/domanin/entities/discount_detal_entity.dart';

import '../../pages/page_discount_detal.dart';
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
          // color: Colors.red,
          borderRadius: BorderRadius.circular(8),
          boxShadow: ThemeP.of(context).shadows.discount,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: Theme.of(context).canvasColor,
            child: Column(children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    color: ThemeP.of(context).colors.shimmerBg,
                    height: arentir * 0.29,
                    child: ShimmerImg(imageUrl: obj.img, fit: BoxFit.fill),
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
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
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
      ),
    );
  }
}
