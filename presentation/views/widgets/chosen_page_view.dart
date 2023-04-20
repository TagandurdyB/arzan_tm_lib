import 'dart:async';

import 'package:arzan_tm/config/system_info/my_size.dart';
import 'package:arzan_tm/domanin/entities/chosen_entity.dart';
import 'package:flutter/material.dart';

class ChosenPageView extends StatefulWidget {
  final List<ChosenEntity> objs;
  const ChosenPageView({super.key, required this.objs});

  @override
  State<ChosenPageView> createState() => _ChosenPageViewState();
}

class _ChosenPageViewState extends State<ChosenPageView> {
  PageController controller = PageController();
  final double arentir = MySize.arentir;
  late Timer timer;
  int index = 0;
  int length = 0;

  @override
  void initState() {
    length = widget.objs.length;
    super.initState();
    if (widget.objs.isEmpty) {
    } else if (widget.objs.length == 1) {
      controller = PageController(
        viewportFraction: 0.3,
        initialPage: 0,
      );
    } else {
      controller = PageController(
        viewportFraction: 0.34,
        initialPage: 1,
      );
    }

    viewer();

    if (widget.objs.length > 3) {
      timer = Timer.periodic(const Duration(seconds: 4), (timer) {
        setToNext();
      });
    }
  }

  void setToNext() {
    // double offset = controller.offset;
    // final offsetVal = (arentir * 0.31) + (offset);
    // print("offset:=$offset");
    // controller.animateTo(offsetVal,
    //     duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void viewer() {
    controller.addListener(() {
      // controller.
    });
  }

  void onPageChanged(int index) {
    setState(() {
      // pageIndex = index - 1;
      print("PageIndex:=$index");
      if (index == 0) {
        // pageIndex = 0;
        controller.animateToPage(1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      } else if (index == length - 1) {
        controller.animateToPage(1,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut);
      }
    });
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
      child: PageView.builder(
        onPageChanged: onPageChanged,
        controller: controller,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.objs.length,
        itemBuilder: (context, index) {
          return buildCard(index);
        },
      ),
    );
  }

  Widget buildCard(int index) {
    return Container(
      //color: Colors.red,
      //width: arentir * 0.28,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(arentir * 0.02),
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(arentir * 0.02)),
              // image: DecorationImage(
              //   image: NetworkImage(widget.objs[index].imageUrl),
              //   fit: BoxFit.cover,
              // ),
              color: Colors.black38,
            ),
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
