import 'dart:async';

import '/presentation/providers/data/main_page_provider.dart';

import '/config/vars/formater.dart';

import '../../../../domanin/entities/chosens/chosen_entity.dart';

import '../../../../config/services/my_size.dart';
import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

import '../../../providers/view/provider_theme.dart';
import '../card_title.dart';
import 'chosen_card.dart';

class ChosenPageView extends StatefulWidget {
  final List<ChosenEntity> objs;
  final String title;
  final int count;
  final Function? allBtnOnTap;
  const ChosenPageView(
      {super.key,
      required this.objs,
      required this.count,
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

  @override
  void initState() {
    length = widget.objs.length < 3 ? 3 : widget.objs.length;
    rounder;
    super.initState();
  }

  void get rounder {
    if (length < 3) {
      for (int i = 0; i < (3 - length); i++) {
        widget.objs.add(ChosenEntity.empty);
      }
    } else if (length == 3) {
      Future.delayed(const Duration(milliseconds: 500))
          .then((value) => setToNext());
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

  late MainPageP providM;
  @override
  Widget build(BuildContext context) {
    providM = MainPageP.of(context);
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
              itemCount: widget.objs.length,
              itemBuilder: (context, index) {
                return ChosenCard(
                  idList: ChosenEntity.idList(providM.entity.saylananlarDatas),
                  index: index,
                  obj: providM.entity.saylananlarDatas[index],
                );
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
          CardTitle(counter: widget.count, title: widget.title),
          TextButton(
            onPressed: () {
              if (widget.allBtnOnTap != null) widget.allBtnOnTap!();
            },
            child: const Text(
              "Hemmesi",
              style: TextStyle(color: Color(0xff008631)),
            ),
          )
        ],
      );
}
