// ignore_for_file: must_be_immutable

import 'package:hive_flutter/hive_flutter.dart';

import '../../../../domanin/entities/hive_boxes.dart';
import '../../screens/discounts/screen_discout_detal.dart';
import '/domanin/entities/discounts/discount_entity.dart';
import '/presentation/views/pages/lotties/page_500.dart';

import '/presentation/providers/data/discount_data_provider.dart';

import '../../../../config/routes/my_route.dart';
import '/config/services/connection.dart';

import '../../../../config/services/my_size.dart';
import '../../../../domanin/entities/discounts/discount_detal_entity.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class DiscountDetal extends StatefulWidget {
  final int id;
  final bool isFavorite;
  const DiscountDetal({required this.id, this.isFavorite = false, super.key});

  @override
  State<DiscountDetal> createState() => _DiscountDetalState();
}

class _DiscountDetalState extends State<DiscountDetal> {
  final double arentir = MySize.arentir;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    if (widget.isFavorite) {
      parrentList =
          Boxes.getFavoriteDiscounts().values.toList().cast<DiscountEntity>();
    }
    checkConnect();
  }

  void checkConnect() async {
    final bool isConnect = await ConnectionService.isConnected();
    if (!isConnect) Navigator.pushNamed(context, Rout.disconnect);
    // if (!isConnect) {
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     DiscountDataP.of(context, listen: false).fillDetal(widget.id);
    //   });
    // } else {
    //   Navigator.pushNamed(context, Rout.disconnect);
    // }
  }

  late DiscountDetalEntity obj;
  @override
  late BuildContext context;

  PageController control = PageController(
    initialPage: 1,
    keepPage: true,
  );

  late int id;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    // obj = DiscountDataP.of(context).detal;

    return ScaffoldNo(
      body: PageView.builder(
        controller: control,
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          if (index == 1) {
///////////////////////////////////////////////
            return widget.isFavorite ? buildFavoriteDetal() : buildDetal(id);
///////////////////////////////////////////////
          } else {
            return const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(color: Colors.green));
          }
          // else if (index == 0) {
          //   //previous
          //   return buildDetal(widget.id);
          // } else if (index == 2) {
          //   //next
          //   return buildDetal(widget.id);
          // }
          // return null;
        },
        onPageChanged: (int index) {
          final discountP = DiscountDataP.of(context, listen: false);
          setState(() {
            if (index == 0) {
              Future.delayed(const Duration(milliseconds: 200)).then((value) {
                control.nextPage(
                    duration: const Duration(microseconds: 1),
                    curve: Curves.linear);
              });
              discountP.pervious;
              id = discountP.discoutID;
            } else if (index == 2) {
              Future.delayed(const Duration(milliseconds: 200)).then((value) {
                control.previousPage(
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.linear);
              });

              widget.isFavorite
                  ? discountP
                      .nextFavorite(parrentList.length)
                  : discountP.next;
              id = discountP.discoutID;
            }
          });
        },
      ),
    );
  }

  late List<DiscountEntity> parrentList;

  Widget buildFavoriteDetal() {
    final int index = DiscountDataP.of(context).discoutIndex;
    return FutureBuilder(
      future: DiscountDataP.of(context, listen: false)
          .fetchDetal(parrentList[index].id),
      builder: (context, ss) {
        if (ss.hasError) {
          print("error in detal favorite post :=${ss.error}");
          return Page500();
        } else if (ss.hasData) {
          obj = ss.data!;
          return DiscountDetalScreen(
            obj: obj,
            parrentObj: parrentList[index],
          );
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.green,
          ));
        }
      },
    );
  }

  FutureBuilder<DiscountDetalEntity> buildDetal(int id) {
    return FutureBuilder(
        future: DiscountDataP.of(context, listen: false).fetchDetal(id),
        builder: (context, ss) {
          if (ss.hasError) {
            print("error in detal post :=${ss.error}");
            return Page500();
          } else if (ss.hasData) {
            obj = ss.data!;
            print("Post Detal ${obj.id}");
            return DiscountDetalScreen(
              obj: obj,
              parrentObj: DiscountDataP.of(context).discout,
            );
            // return Column(children: [
            //   CustomAppBar(
            //     titleW: buildTitle(obj.userImg, obj.userName),
            //   ),
            //   Expanded(
            //       child: SingleChildScrollView(
            //     physics: const BouncingScrollPhysics(),
            //     child: buildContent,
            //   ))
            // ]);
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          }
        });
  }
}
