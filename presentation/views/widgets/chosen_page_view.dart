import 'dart:async';

import 'all_btn.dart';

import '/config/system_info/my_size.dart';
import '/domanin/entities/chosen_entity.dart';
import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

import '../../providers/view/provider_theme.dart';
import 'card_title.dart';

class ChosenPageView extends StatefulWidget {
  final List<ChosenEntity> objs;
  final String title;
  final Function? allBtnOnTap;
  const ChosenPageView(
      {super.key,
      required this.objs,
      this.title = "Saýlananlar",
      this.allBtnOnTap});

  @override
  State<ChosenPageView> createState() => _ChosenPageViewState();
}

class _ChosenPageViewState extends State<ChosenPageView> {
  PageController controller = PageController(
    initialPage: 1,
    viewportFraction: 0.34,
  );
  final double arentir = MySize.arentir;
  late Timer timer;
  int index = 0;
  int length = 0;
  List<ChosenEntity> objs = [];

  @override
  void initState() {
    objs = widget.objs;
    length = objs.length < 3 ? 3 : objs.length;
    rounder;
    super.initState();
  }

  void get rounder {
    if (length < 3) {
      for (int i = 0; i < (3 - length); i++) {
        objs.add(ChosenEntity.empty());
      }
    } else if (length > 3) {
      //Timer
      timer = Timer.periodic(const Duration(seconds: 4), (timer) {
        setToNext();
      });
    }
  }

  void setToNext() {
    final int page = controller.page!.toInt();
    int newPage = 1;
    if (length - (page + 1) > 3) {
      newPage = page + 3;
    } else if (length - (page + 1) > 1) {
      newPage = page + (length - (page + 1) - 1);
    } else if (page == length - 2) {
      newPage = 1;
    } else {
      newPage = length - 1;
    }
    controller.animateToPage(newPage,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void onPageChanged(int index) {
    // debugPrint("onPageChanged:=$index");
    if (index == 0) {
      controller.animateToPage(1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else if (index == length - 1) {
      controller.animateToPage(length - 2,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    if (length > 3) timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: arentir * 0.04),
      height: arentir * 0.57,
      child: Column(
        children: [
          buildTitle,
          Flexible(
            child: PageView.builder(
              onPageChanged: onPageChanged,
              controller: controller,
              physics: const BouncingScrollPhysics(),
              itemCount: objs.length,
              itemBuilder: (context, index) {
                return buildCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget get buildTitle => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardTitle(counter: widget.objs.length, title: widget.title),
          AllBtn(
            onTap: () {
              if (widget.allBtnOnTap != null) widget.allBtnOnTap!();
            },
          )
        ],
      );

  Widget buildCard(int index) {
    return Visibility(
      visible: !objs[index].isEmpty,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(arentir * 0.02),
            child: Container(
              //margin: EdgeInsets.all(arentir * 0.01),
              color: ThemeP.of(context).colors.shimmerBg,
              width: arentir * 0.28,
              alignment: Alignment.center,
              child: AspectRatio(
                  aspectRatio: 1 / 1.38,
                  child: ShimmerImg(
                      fit: BoxFit.fill, imageUrl: objs[index].imageUrl)),
            ),
          ),
          buildBottom(index),
        ],
      ),
    );
  }

  Container buildBottom(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(arentir * 0.02)),
        color: Colors.black54,
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
              style: TextStyle(fontSize: arentir * 0.03, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.objs[index].formatDate,
              style: TextStyle(
                  fontSize: arentir * 0.02, color: const Color(0xffC4C4C4)),
            ),
          ),
        ),
      ]),
    );
  }
}
