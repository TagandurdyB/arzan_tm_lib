import '/presentation/views/widgets/shimmer_img.dart';

import '/config/system_info/my_size.dart';
import '/domanin/entities/main_market_entity.dart';
import 'package:flutter/material.dart';

class MainMarketsView extends StatelessWidget {
  final List<MainMarketEntity> objs;
  const MainMarketsView({required this.objs, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MySize.arentir * 0.2,
      width: double.infinity,
      // color: Colors.red,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: MySize.arentir * 0.025),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        // children: List.generate(
        //     10,
        //     (index) => MarketAwatar(
        //           obj: objs[index],
        //         )),
        children: objs.map((e) => MarketAwatar(obj: e)).toList(),
      ),
    );
  }

  // Widget buildMarket(obj) {
  //   return Container(
  //     width: arentir * 0.16,
  //     color: Colors.blue,
  //     margin: EdgeInsets.all(arentir*0.02),
  //     child: Container,
  //   );
  // }
}

class MarketAwatar extends StatelessWidget {
  final MainMarketEntity obj;
  MarketAwatar({required this.obj, super.key});

  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      margin: EdgeInsets.symmetric(horizontal: arentir * 0.02),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                width: arentir * 0.15,
                height: arentir * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(arentir * 0.1),
                  border: Border.all(
                      color: Colors.green.shade600, width: arentir * 0.007),
                  // color: Colors.red,
                ),
                child: ClipOval(child: ShimmerImg(imageUrl: obj.imageUrl)),
              ),
              Text(
                obj.name,
                style: TextStyle(fontSize: arentir * 0.03),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            width: arentir * 0.05,
            height: arentir * 0.05,
            decoration: BoxDecoration(
              color: const Color(0xff10C337),
              borderRadius: BorderRadius.circular(arentir * 0.05),
              border: Border.all(color: Colors.white, width: arentir * 0.005),
            ),
            child: Text("${obj.num}",
                style:
                    TextStyle(fontSize: arentir * 0.03, color: Colors.white)),
          )
        ],
      ),
    );
  }
}
