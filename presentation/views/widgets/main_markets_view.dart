import '/domanin/entities/main_page/market_entity.dart';

import '/presentation/views/widgets/shimmer_img.dart';

import '../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

class MainMarketsView extends StatelessWidget {
  final List<MarketEntity> objs;
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
        children: objs.map((e) => MarketAwatar(obj: e)).toList(),
      ),
    );
  }

}

class MarketAwatar extends StatelessWidget {
  final MarketEntity obj;
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
                child: ClipOval(child: ShimmerImg(imageUrl: obj.logo)),
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
            child: Text("${obj.mod}",
                style:
                    TextStyle(fontSize: arentir * 0.03, color: Colors.white)),
          )
        ],
      ),
    );
  }
}
