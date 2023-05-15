// ignore_for_file: must_be_immutable

import 'package:arzan_tm/config/vars/formater.dart';
import 'package:arzan_tm/presentation/views/widgets/shimmer_img.dart';

import '../../../config/services/my_size.dart';
import '../widgets/custom_avatar.dart';
import '../widgets/post/btns_group.dart';
import '/domanin/entities/discount_detal_entity.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

import '../scaffold/custom_app_bar.dart';

class DiscountDetal extends StatelessWidget {
  final DiscountDetalEntity obj;
  DiscountDetal({required this.obj, super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
      body: Column(children: [
        CustomAppBar(
          titleW: buildTitle(obj.userImg, obj.userName),
        ),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: buildContent,
        ))
      ]),
    );
  }

  Widget buildTitle(String imgUrl, String title) {
    return Padding(
      padding: EdgeInsets.all(arentir * 0.02),
      child: Row(
        children: [
          CustomAvatar(
            imgUrl: imgUrl,
            // bgColor: Colors.blue,
            radius: arentir * 0.08,
            borderWidth: 2,
          ),
          buildStar,
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Container get buildStar {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xffB47D3F),
          border: Border.all(color: const Color(0xffE2BD83), width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: const Icon(
        Icons.star,
        color: Color(0xffE2BD83),
        size: 15,
      ),
    );
  }

  Widget get buildContent {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImgIndicatorView(imgs: obj.pictures),
        buildGadgets,
        buildCounts,
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            obj.title,
            style: TextStyle(fontSize: arentir * 0.055),
          ),
        ),
        const Divider(color: Color(0xffE5E5E5)),
        buildPrices,
        const Divider(color: Color(0xffE5E5E5)),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            obj.about,
            style: TextStyle(fontSize: arentir * 0.041),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Wrap(
            spacing: 8,
            children: obj.tags.map((tag) => buildTag(tag)).toList(),
          ),
        ),
        const SizedBox(height: 10),
        buildBtns,
        const SizedBox(height: 30),
      ],
    );
  }

  Widget get buildGadgets {
    return Row(children: [
      buildBtn(() {}, Icons.bookmark_outline_outlined),
      buildBtn(() {}, Icons.chat_outlined),
      buildBtn(() {}, Icons.switch_access_shortcut_add_rounded),
      const Expanded(child: SizedBox()),
      buildBtn(
        () {},
        Icons.favorite_border,
        color: const Color(0xffE50027),
      ),
    ]);
  }

  Widget buildBtn(Function func, IconData iconD, {Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
          onTap: () => func(),
          child: Icon(
            iconD,
            color: color,
          )),
    );
  }

  Widget get buildCounts {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        buildCount(Formater.calendar(obj.createdAt)),
        SizedBox(width: arentir * 0.04),
        buildCount(Formater.rounder(obj.viewed),
            iconD: Icons.remove_red_eye_outlined),
        SizedBox(width: arentir * 0.04),
        buildCount(Formater.rounder(obj.liked), iconD: Icons.favorite_border),
        SizedBox(width: arentir * 0.04),
        buildCount(Formater.rounder(obj.chated), iconD: Icons.chat_outlined),
      ]),
    );
  }

  Widget buildCount(String text, {IconData? iconD}) {
    return Row(
      children: [
        Visibility(
          visible: iconD != null,
          child: Row(
            children: [
              Icon(
                iconD,
                color: const Color(0xff747474),
                size: arentir * 0.045,
              ),
              SizedBox(width: arentir * 0.02),
            ],
          ),
        ),
        Text(text,
            style: TextStyle(
                color: const Color(0xff747474), fontSize: arentir * 0.03)),
      ],
    );
  }

  Widget get buildPrices {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            children: [
              Text(Formater.rounder(obj.oldPrice)),
              Row(
                children: [
                  Text(Formater.rounder(obj.newPrice)),
                  const Text("manat")
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_month),
                  Text(
                      "${Formater.calendar(obj.startedAt)} - ${Formater.calendar(obj.endedAt)}"),
                ],
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          CircleAvatar(
            backgroundColor: const Color(0xff0EC243),
            child: Text(
              "${obj.mod}%",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTag(String tag) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green.shade100, borderRadius: BorderRadius.circular(3)),
      padding: const EdgeInsets.all(6),
      child: Text("#$tag",
          style: TextStyle(
              fontSize: arentir * 0.04, color: const Color(0xff1C9448))),
    );
  }

  Widget get buildBtns {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        Expanded(
          child: BorderBtn(onTap: () {}),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: SuccessBtn(onTap: () {}),
        ),
      ]),
    );
  }
}

class ImgIndicatorView extends StatefulWidget {
  const ImgIndicatorView({super.key, required this.imgs});

  final List<String> imgs;

  @override
  State<ImgIndicatorView> createState() => _ImgIndicatorViewState();
}

class _ImgIndicatorViewState extends State<ImgIndicatorView> {
  int _viewedIndex = 0;

  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: arentir * 0.9,
      width: double.infinity,
      child: Stack(
        children: [
          PageView(
            scrollDirection: Axis.vertical,
            children: widget.imgs.map((e) => ShimmerImg(imageUrl: e)).toList(),
            onPageChanged: (index) => setState(() => _viewedIndex = index),
          ),
          Positioned(
              bottom: 15,
              left: 15,
              child: Column(
                children: List.generate(
                  widget.imgs.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: _viewedIndex != index
                          ? Colors.white54
                          : const Color(0xff0EC243),
                    ),
                  ),
                ),
                // children: widget.imgs
                //     .map(
                //       (e) => const Padding(
                //         padding: EdgeInsets.all(2.0),
                //         child: CircleAvatar(
                //           radius: 4,
                //           backgroundColor:_viewedIndex==index Color(0xff0EC243),
                //         ),
                //       ),
                //     )
                //     .toList(),
              ))
        ],
      ),
    );
  }
}
