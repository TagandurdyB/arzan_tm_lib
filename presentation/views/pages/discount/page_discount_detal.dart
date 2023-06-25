// ignore_for_file: must_be_immutable

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
  final DiscountEntity parrentObj;
  final int id;
  const DiscountDetal({required this.parrentObj, required this.id, super.key});

  @override
  State<DiscountDetal> createState() => _DiscountDetalState();
}

class _DiscountDetalState extends State<DiscountDetal> {
  final double arentir = MySize.arentir;

  @override
  void initState() {
    super.initState();
    id = widget.id;
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
            return buildDetal(id);
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
          setState(() {
            if (index == 0) {
              Future.delayed(const Duration(milliseconds: 200)).then((value) {
                control.nextPage(
                    duration: const Duration(microseconds: 1),
                    curve: Curves.linear);
              });
              id = 1;
            } else if (index == 2) {
              Future.delayed(const Duration(milliseconds: 200)).then((value) {
                control.previousPage(
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.linear);
              });
              id = 2;
            }
          });
        },
      ),
    );
  }

  FutureBuilder<DiscountDetalEntity> buildDetal(int id) {
    return FutureBuilder(
        future: DiscountDataP.of(context, listen: false).fetchDetal(id),
        builder: (context, ss) {
          if (ss.hasError) {
            return Page500();
          } else if (ss.hasData) {
            obj = ss.data!;
            return DiscountDetalScreen(
              obj: obj, 
              parrentObj: widget.parrentObj,
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

