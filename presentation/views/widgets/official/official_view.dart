import '/presentation/views/widgets/official/official_1_card.dart';

import '../../../../domanin/entities/discounts/discount_detal_entity.dart';
import '../../../../domanin/entities/official_entity.dart';
import '../../pages/discount/page_discount_detal.dart';

import '/presentation/providers/view/provider_discaunts.dart';

// import 'package:entry/entry.dart';

import '../../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

import 'official_2_card.dart';

class OfficialView extends StatefulWidget {
  final List<OfficialEntity> objs;
  const OfficialView({required this.objs, super.key});

  @override
  State<OfficialView> createState() => _OfficialViewState();
}

class _OfficialViewState extends State<OfficialView> {
  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    final providD = DiscountProvid.of(context);
    return SliverGrid.builder(
        itemCount: widget.objs.length,
        gridDelegate: _delegateChanger(providD.cloumnCount),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DiscountDetal(
                              obj: DiscountDetalEntity(
                                userImg:
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_E4eeQGKiE_bfmItiIM8uUXm3cYFTNQ8Siw&usqp=CAU",
                                userName: "100haryt",
                                pictures: [
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCJgQkIzfThEOELfWHJbRXvDPbuAEIRo8Dog&usqp=CAU",
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCJgQkIzfThEOELfWHJbRXvDPbuAEIRo8Dog&usqp=CAU",
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCJgQkIzfThEOELfWHJbRXvDPbuAEIRo8Dog&usqp=CAU",
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCJgQkIzfThEOELfWHJbRXvDPbuAEIRo8Dog&usqp=CAU",
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCJgQkIzfThEOELfWHJbRXvDPbuAEIRo8Dog&usqp=CAU",
                                ],
                                id: 1,
                                createdAt: DateTime.now(),
                                viewed: 14756,
                                liked: 5693,
                                chated: 216,
                                title:
                                    "Realme C33 Smartfon 4/128 GB, altyn reňk",
                                oldPrice: 9000,
                                newPrice: 6930,
                                mod: 23,
                                userId: 2,
                                isOfficial: true,
                                startedAt: DateTime.now(),
                                endedAt: DateTime.now(),
                                about:
                                    "Dinamiki surata düşüriň we ulanyjy interfeýsiňizi indiki derejä çykarmak üçin oýlanyşykly döredilen C33 realme bilen suwuk wizuallardan lezzet alyň. Bu telefon, AI bilen dolandyrylýan 50 MP kamerany görkezýär, bu düşnüksiz suratlary aýdyňlyk bilen ajaýyp düşürmäge mümkinçilik berýär. Mundan başga-da, bu smartfona 5000 mAh uly batareýa goşulyp, üznüksiz öndürijilikden lezzet alyp bilersiňiz we işdäki öndürijiligiňizi ýokarlandyryp bilersiňiz. Mundan başga-da, ajaýyp “Unisoc T612” prosessor bilen işleýän, ajaýyp iş tejribesinden lezzet alyp bilersiňiz. Mundan başga-da, C33 meýdanynyň giňligi 16.5 sm (6.5) paneliň kömegi bilen wizual tejribäňizi ýokary derejä çykaryp bilersiňiz.",
                                tags: ["realme", "phone"],
                                phone: "+99365168618",
                              ),
                            )));
              },
              child: buildDiscountCard(index, providD.cloumnCount));
          // return Entry.scale(
          //     visible: providD.scaleVisible,
          //     scale: 0,
          //     curve: Curves.easeInOut,
          //     // delay: const Duration(milliseconds: 40),
          //     duration: const Duration(milliseconds: 300),
          //     child: buildDiscountCard(index, providD.cloumnCount));
        });
  }

  SliverGridDelegate _delegateChanger(int columnNum) {
    switch (columnNum) {
      case 1:
        return _delegate(0.05, 0.25, 1);
      case 2:
        return _delegate(0.05, 0.54, 0.5);
      case 3:
        return _delegate(0.05, 0.37, 0.4);
      default:
        return _delegate(0.05, 0.46, 0.5);
    }
  }

  SliverGridDelegate _delegate(double mainSp, double mainEx, double crossEx) {
    return SliverGridDelegateWithMaxCrossAxisExtent(
      mainAxisSpacing: arentir * mainSp,
      mainAxisExtent: arentir * mainEx,
      maxCrossAxisExtent: arentir * crossEx,
    );
  }

  Widget buildDiscountCard(int index, int columnNum) {
    switch (columnNum) {
      case 1:
        return OfficialCardFirst(obj: widget.objs[index]);
      case 2:
        return OfficialCardSecond(obj: widget.objs[index]);
      case 3:
        return OfficialCardFirst(obj: widget.objs[index]);
      default:
        return OfficialCardFirst(obj: widget.objs[index]);
    }
  }
}
