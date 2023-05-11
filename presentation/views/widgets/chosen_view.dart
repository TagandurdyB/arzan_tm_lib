import 'dart:async';

import '../../../config/services/my_size.dart';
import '/domanin/entities/chosen_entity.dart';
import 'package:flutter/material.dart';

class ChosenView extends StatefulWidget {
  final List<ChosenEntity> objs;
  const ChosenView({super.key, required this.objs});

  @override
  State<ChosenView> createState() => _ChosenViewState();
}

class _ChosenViewState extends State<ChosenView> {
  final ScrollController controller = ScrollController();
  final double arentir = MySize.arentir;
  late Timer timer;
  int index = 0;

  @override
  void initState() {
    super.initState();
    if (widget.objs.length > 3) {
      timer = Timer.periodic(const Duration(seconds: 4), (timer) {
        setToNext();
      });
    }
  }

  void setToNext() {
    double offset = controller.offset;
    final offsetVal = (arentir * 0.31) + (offset);
    print("offset:=$offset");
    controller.animateTo(offsetVal,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      padding: EdgeInsets.symmetric(vertical: arentir * 0.04),
      height: arentir * 0.45,
      child: ListView.separated(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return buildCard(index);
        },
        itemCount: widget.objs.length,
        separatorBuilder: (context, index) {
          return SizedBox(width: arentir * 0.03);
        },
      ),
    );
  }

  Widget buildCard(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(arentir * 0.02),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              // image: DecorationImage(
              //   image: NetworkImage(widget.objs[index].imageUrl),
              //   fit: BoxFit.cover,
              // ),
              color: Colors.green,
            ),
            //margin: EdgeInsets.all(arentir * 0.01),

            width: arentir * 0.28,
            alignment: Alignment.center,
            child: Text(
              "$index",
              style: TextStyle(fontSize: arentir * 0.07),
            ),
          ),
          Container(
            color: Colors.black38,
            height: arentir * 0.09,
            width: arentir * 0.28,
            padding: EdgeInsets.symmetric(
                vertical: arentir * 0.01, horizontal: arentir * 0.02),
            child: Column(children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.objs[index].name,
                    style: TextStyle(
                        fontSize: arentir * 0.035, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.objs[index].formatDate,
                    style: TextStyle(
                        fontSize: arentir * 0.02,
                        color: const Color(0xffC4C4C4)),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
